import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failures/common_exception_handler.dart';
import '../../../../core/failures/exception.dart';
import '../../../../core/utils/lang.dart';
import '../../../auth/core/failures/auth_exception.dart';
import '../../../auth/core/failures/auth_exception_handler.dart';
import '../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../student_parking/core/failures/student_parking_exception_handler.dart';
import '../../presentation/widgets/custom_toast.dart';

class ProviderListenerUtil {
  const ProviderListenerUtil._();

  static void listenError({
    required WidgetRef ref,
    required ProviderListenable<AsyncValue> provider,
    required BuildContext context,
    void Function(String message)? onError,
  }) {
    ref.listen<AsyncValue>(provider, (previous, next) {
      if (next is AsyncError) {
        final failure = next.error;
        log("ERROR HANDLER ${failure}");
        if (failure is CommonException) {
          CustomToast.showToast(
            context,
            message: CommonExceptionHandler.of(context, failure),
          );
        } else if (failure is AuthException) {
          CustomToast.showToast(
            context,
            message: AuthExceptionHandler.of(context, failure),
          );
        } else if (failure is StudentParkingException) {
          CustomToast.showToast(
            context,
            message: StudentParkingExceptionHandler.of(context, failure),
          );
        } else {
          CustomToast.showToast(
            context,
            message: Lang.of(context).unknownError,
          );
        }
      }
    });
  }

  static void listenSuccess<T>({
    required WidgetRef ref,
    required ProviderListenable<AsyncValue<T>> provider,
    required void Function(T? value) onSuccess,
  }) {
    ref.listen<AsyncValue<T>>(provider, (previous, next) {
      if (next is AsyncData && previous != next) {
        onSuccess(next.value);
      }
    });
  }
}
