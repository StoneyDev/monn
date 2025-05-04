import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';

class MonnSnackBar {
  const MonnSnackBar._();

  static SnackBar success({required String message}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.green50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Text(
        message,
        style: const TextStyle(color: AppColors.green),
      ),
    );
  }

  static SnackBar error({required String message}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.red50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Text(
        message,
        style: const TextStyle(color: AppColors.red),
      ),
    );
  }

  static SnackBar info({required String message}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.blue50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Text(
        message,
        style: const TextStyle(color: AppColors.blue),
      ),
    );
  }
}
