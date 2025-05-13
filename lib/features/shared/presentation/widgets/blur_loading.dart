import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/fonts/app_font.dart';

import '../../../../core/constants/assets/image_asset_constant.dart';
import '../../../../core/utils/lang.dart';

class BlurLoading extends StatefulWidget {
  const BlurLoading({super.key});

  @override
  State<BlurLoading> createState() => _BlurLoadingState();
}

class _BlurLoadingState extends State<BlurLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _dotCountAnimation;
  final double _imageSize = 80;
  final double _containerSize = 235;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _dotCountAnimation = IntTween(
      begin: 0,
      end: 3,
    ).animate(_animationController)..addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _loadingText(BuildContext context) {
    final baseText = Lang.of(context).loading;
    final dots = '.' * _dotCountAnimation.value;
    return '$baseText$dots';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.black.withValues(alpha: 0.4),
            child: Center(
              child: Container(
                height: _containerSize.h,
                width: _containerSize.w,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.0 + _animationController.value * 0.3,
                          child: child,
                        );
                      },
                      child: Image.asset(
                        ImageAssetConstant.appLogoWhite,
                        fit: BoxFit.cover,
                        height: _imageSize,
                        width: _imageSize,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      _loadingText(context),
                      style: AppFont.labelSmall(
                        context,
                      )?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
