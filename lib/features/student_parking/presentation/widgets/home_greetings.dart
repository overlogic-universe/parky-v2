import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';
import '../../core/utils/home_util.dart';

class HomeGreetings extends ConsumerWidget {
  const HomeGreetings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initState = ref.watch(initViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeUtil.getHomeGreeting(context),
          style: AppFont.displaySmall(context),
        ),
        initState.maybeWhen(
          data:
              (data) => Text(
                HomeUtil.getMiddleName(data.student?.name ?? ""),
                style: AppFont.displayLarge(
                  context,
                )?.copyWith(color: AppColor.primary(context)),
              ),
          orElse: () => SizedBox.shrink(),
        ),
      ],
    );
  }
}
