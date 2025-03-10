import 'package:flutter/material.dart';

import 'failure.dart';

class FailureHandler {
  // TODO: inisialisasi pesan error berdasarkan Failure
  
  static void handleFailure({
    required BuildContext context,
    required Failure failure,
  }) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        // Lang.of(context).serverError;
        break;
      case const (OfflineFailure):
        break;
      case const (LoginFailure):
        break;
      default:
        break;
    }
  }
}
