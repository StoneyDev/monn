import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/local/database_backup.dart';
import 'package:monn/utils/app_colors.dart';

typedef DatabaseRestoreRequest = ({File? externalBackup});
typedef RestoreDatabase =
    Future<bool> Function({
      File? externalBackup,
      DatabaseRestoreProgress? onProgress,
    });

class DatabaseRestoreDialog extends StatefulWidget {
  const DatabaseRestoreDialog({
    required this.request,
    required this.restore,
    super.key,
  });

  final DatabaseRestoreRequest request;
  final RestoreDatabase restore;

  @override
  State<DatabaseRestoreDialog> createState() => _DatabaseRestoreDialogState();
}

class _DatabaseRestoreDialogState extends State<DatabaseRestoreDialog> {
  DatabaseRestoreStep _step = .validating;
  bool? _restored;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _restore());
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: _restored != null,
    child: AlertDialog(
      title: Text(context.tr(LocaleKeys.restore_title)),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: switch (_restored) {
          null => Row(
            spacing: 16,
            children: [
              const SizedBox.square(
                dimension: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              Expanded(
                child: Text(
                  context.tr(
                    switch (_step) {
                      DatabaseRestoreStep.validating =>
                        LocaleKeys.restore_validating,
                      DatabaseRestoreStep.creatingRecovery =>
                        LocaleKeys.restore_creating_recovery,
                      DatabaseRestoreStep.replacing =>
                        LocaleKeys.restore_replacing,
                      DatabaseRestoreStep.finalizing =>
                        LocaleKeys.restore_finalizing,
                    },
                  ),
                ),
              ),
            ],
          ),
          true => Row(
            spacing: 16,
            children: [
              const Icon(Icons.check_circle, color: AppColors.green),
              Expanded(
                child: Text(
                  context.tr(LocaleKeys.restore_success),
                ),
              ),
            ],
          ),
          false => Row(
            spacing: 16,
            children: [
              const Icon(Icons.error, color: AppColors.red),
              Expanded(
                child: Text(context.tr(LocaleKeys.restore_error)),
              ),
            ],
          ),
        },
      ),
      actions: [
        if (_restored == false)
          TextButton(
            onPressed: _restore,
            child: Text(context.tr(LocaleKeys.button_retry)),
          ),
        if (_restored != null)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.tr(LocaleKeys.button_close)),
          ),
      ],
    ),
  );

  Future<void> _restore() async {
    if (_restored != null) {
      setState(() {
        _restored = null;
        _step = .validating;
      });
    }
    final restored = await widget.restore(
      externalBackup: widget.request.externalBackup,
      onProgress: (step) {
        if (mounted && _step != step) setState(() => _step = step);
      },
    );
    if (!mounted) return;

    setState(() => _restored = restored);
  }
}
