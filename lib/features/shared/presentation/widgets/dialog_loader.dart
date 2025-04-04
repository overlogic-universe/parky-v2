import 'package:flutter/material.dart';

import 'blur_loading.dart';

class DialogLoader {
  const DialogLoader._();

  static Future<void> startLoading(BuildContext context) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (BuildContext context) => BlurLoading(),
    );
  }

  static Future<void> stopLoading(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
