import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum SnackBarType { success, error, info }

class SnackBarUtils {
  //todo: icon & color
  static void _show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.success,
    int duration = 3,
    Function()? onTap,
  }) async {
    Widget icon = const Icon(Icons.check);
    Color color = Colors.green;
    // haptic();
    switch (type) {
      case SnackBarType.success:
        icon = const Icon(Icons.check);
        color = Colors.green;
        break;
      case SnackBarType.error:
        icon = const Icon(Icons.error_outline);
        color = Colors.red;
        break;
      case SnackBarType.info:
        icon = const Icon(Icons.info_outline);
        color = Colors.blue;
        break;
      default:
        icon = const Icon(Icons.check);
        color = Colors.green;
        break;
    }

    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
        iconRotationAngle: 0,
        iconPositionLeft: 4,
        textStyle: const TextStyle(),
        //todo:
        backgroundColor: color,
        messagePadding: const EdgeInsets.only(left: 56, right: 16),
        icon: icon,
      ),
      displayDuration: Duration(seconds: duration),
      onTap: onTap,
    );
  }

  static dynamic showSuccess(
    String message, {
    Function()? onTap,
  }) =>
      _show(
        Get.context!,
        message,
        onTap: onTap,
      );

  static dynamic showInfo(
    String message, {
    Function()? onTap,
  }) =>
      _show(
        Get.context!,
        message,
        onTap: onTap,
        type: SnackBarType.info,
      );

  static dynamic showError(
    String message,
  ) =>
      _show(
        Get.context!,
        message,
        type: SnackBarType.error,
      );
}
