import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  const CustomToast._();

  static Future<bool?> showToast({
    required String message,
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
    ToastGravity? gravity,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor ?? Colors.grey,
      textColor: textColor ?? Colors.white,
      fontSize: fontSize ?? 14.sp,
    );
  }
}
