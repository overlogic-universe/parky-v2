import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../auth/domain/entities/student_entity.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';

class ParkQrCode extends ConsumerWidget {
  const ParkQrCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initState = ref.watch(initViewModelProvider);

    return initState.when(
      data:
          (data) =>
              data.student == null
                  ? _buildError(context)
                  : _buildQrCode(context, data.student!),

      loading: () => _buildLoading(context),
      error: (e, st) => _buildError(context),
    );
  }

  Widget _buildQrCode(BuildContext context, StudentEntity student) {
    return _buildContainer(
      context,
      child: QrImageView(
        data: student.qrCodeId,
        version: QrVersions.auto,
        size: 200.0.w,
      ),
    );
  }

  Widget _buildLoading(BuildContext context) => _buildContainer(context);

  Widget _buildContainer(BuildContext context, {Widget? child}) {
    final containerSize = 200.w;

    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        color: AppColor.containerColorPrimary(context),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: child,
    );
  }

  Widget _buildError(BuildContext context) {
    final containerSize = 200.w;

    return _buildContainer(
      context,
      child: Shimmer.fromColors(
        baseColor: AppColor.baseShimmerColor(context),
        highlightColor: AppColor.highlightShimmerColor(context),
        child: Container(
          height: containerSize,
          width: containerSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
