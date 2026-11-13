import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MonnBottomSheet {
  const MonnBottomSheet._();

  static SliverWoltModalSheetPage itemList({
    required BuildContext context,
    required Widget sliver,
    required String title,
    Widget? leadingNavBarWidget,
  }) {
    return SliverWoltModalSheetPage(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      surfaceTintColor: Colors.transparent,
      leadingNavBarWidget: leadingNavBarWidget,
      topBar: Padding(
        padding: EdgeInsets.fromLTRB(
          leadingNavBarWidget == null ? 24 : 64,
          0,
          80,
          0,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: IconButton.filledTonal(
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          icon: const iconoir.Xmark(width: 20, height: 20),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      mainContentSliversBuilder: (_) => [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
          sliver: sliver,
        ),
      ],
    );
  }

  static SliverWoltModalSheetPage warningDialog({
    required BuildContext context,
    required String title,
    required VoidCallback onConfirm,
  }) {
    return SliverWoltModalSheetPage(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      surfaceTintColor: Colors.transparent,
      topBarTitle: Text(title, style: Theme.of(context).textTheme.titleLarge),
      isTopBarLayerAlwaysVisible: true,
      mainContentSliversBuilder: (_) => [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 24,
              children: [
                Text(context.tr(LocaleKeys.common_delete_confirmation)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    MonnButton(
                      text: context.tr(LocaleKeys.button_delete),
                      onPressed: () {
                        Navigator.of(context).pop();
                        onConfirm();
                      },
                    ),
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text(context.tr(LocaleKeys.button_cancel)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
