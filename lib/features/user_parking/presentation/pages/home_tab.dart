import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/pages/base_screen_with_decoration.dart';
import '../widgets/home_content.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScreenWithDecoration(
      horizontalPadding: 0,
      child: HomeContent(),
    );
  }
}
