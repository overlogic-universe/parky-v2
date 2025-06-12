import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/core/utils/provider_listener_util.dart';
import '../view_models/park_view_model.dart';

import '../../../shared/presentation/pages/base_screen_with_decoration.dart';
import '../widgets/home_content.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProviderListenerUtil.listenError(
      context: context,
      ref: ref,
      provider: parkViewModelProvider,
    );
    return BaseScreenWithDecoration(horizontalPadding: 0, child: HomeContent());
  }
}
