import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/pages/base_screen_with_decoration.dart';
import '../../../shared/presentation/widgets/app_bar_custom.dart';

class ParkingLotTab extends ConsumerStatefulWidget {
  const ParkingLotTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingLotTabState();
}

class _ParkingLotTabState extends ConsumerState<ParkingLotTab> {

  @override
  Widget build(BuildContext context) {
     return BaseScreenWithDecoration(
      horizontalPadding: 0,
      appBar: AppBarCustom(
        showBackIcon: false,
        title: Text(Lang.of(context).parkingInfo),
      ),
      child: Column(
        children: [
         
        ],
      ),
    );
  }
}