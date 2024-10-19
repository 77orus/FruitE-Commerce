import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';

showToast(String msg, ToastType type) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: getColor(type),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastType { error, success, warning }

Color getColor(ToastType type) {
  switch (type) {
    case ToastType.error:
      return AppColors.errorColor;
    case ToastType.success:
      return AppColors.successColor;
    case ToastType.warning:
      return AppColors.warningColor;
    default:
      return AppColors.errorColor;
  }
}
