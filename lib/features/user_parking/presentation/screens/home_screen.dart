import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/screens/base_screen_with_decoration.dart';
import '../widgets/home_content.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScreenWithDecoration(
      horizontalPadding: 0,
      drawer: HomeDrawer(),
      child: HomeContent(),
    );
  }
}
