import 'package:flutter/material.dart';

import '../constants/assets/image_asset_constant.dart';

class GetLogoAssetUtil {
  const GetLogoAssetUtil._();

  static String of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? ImageAssetConstant.appLogoWhite
        : ImageAssetConstant.appLogo;
  }
}
