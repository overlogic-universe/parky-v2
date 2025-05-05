// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/constants/assets/icon_asset_constant.dart';
// import '../../../../core/styles/colors/app_color.dart';
// import '../../../../core/utils/lang.dart';
// import '../../../shared/presentation/widgets/svg_asset.dart';

// class SearchTextField extends StatelessWidget {
//   final TextEditingController controller;
//   const SearchTextField({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColor.backgroundApp(context),
//         hintText: Lang.of(context).search,
//         prefixIcon: Padding(
//           padding: EdgeInsets.all(10.r),
//           child: SvgAsset(
//             asset: IconAssetConstant.search,
//           ),
//         ),
//       ),
//     );
//   }
// }
