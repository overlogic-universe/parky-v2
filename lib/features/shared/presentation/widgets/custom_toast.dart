import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToastPosition { top, bottom }

class CustomToast {
  static void showToast(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
    Duration duration = const Duration(seconds: 2),
    ToastPosition position = ToastPosition.bottom,
  }) {
    final overlay = Overlay.of(context);

    final mediaQuery = MediaQuery.of(context);

    final topOffset = mediaQuery.padding.top + 40.h;
    final bottomOffset =
        mediaQuery.viewInsets.bottom > 0
            ? mediaQuery.viewInsets.bottom + 20.h
            : mediaQuery.padding.bottom + 40.h;

    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: position == ToastPosition.top ? topOffset : null,
            bottom: position == ToastPosition.bottom ? bottomOffset : null,
            left: 20.w,
            right: 20.w,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor ?? Colors.grey[800],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: fontSize ?? 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () => overlayEntry.remove());
  }
}
