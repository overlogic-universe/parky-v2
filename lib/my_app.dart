import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/common/locale_id_constant.dart';
import 'core/l10n/generated/app_localizations.dart';
import 'core/l10n/l10n.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/route_name.dart';
import 'core/styles/colors/theme_color.dart';
import 'core/styles/themes/modes/app_theme.dart';
import 'features/setting/presentation/view_models/setting_view_model.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(settingViewModelProvider.notifier).getTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => _buildMaterialApp(context),
    );
  }

  MaterialApp _buildMaterialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (ctx, child) {
        final state = ref.watch(settingViewModelProvider);

        final themeColor = state.when(
          data: (data) => ThemeColor.of(data.themeModeType),
          error: (e, s) {
            log("THEME ERROR $e");
           return ThemeColor.of(ThemeModeType.main);
          },
          loading: () {
            log("LOAINH");
            return ThemeColor.of(ThemeModeType.main);
          },
        );
        ScreenUtil.init(ctx);
        return Theme(data: AppTheme.of(context, themeColor), child: child!);
      },
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: RouteName.login,
      supportedLocales: L10n.all,
      locale: Locale(LocaleIdConstant.ID),
    );
  }
}
