import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'svg_asset.dart';

class TextFieldIcon extends StatelessWidget {
  final String icon;
  const TextFieldIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(13.r), child: SvgAsset(asset: icon));
  }
}
