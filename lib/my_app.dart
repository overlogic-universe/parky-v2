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
import 'core/styles/fonts/theme_font.dart';
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
      await ref.read(settingViewModelProvider.notifier).getLanguage();
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
      builder: (ctx, child) => _buildMaterialAppBuilder(ctx, child),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: RouteName.splashScreen,
      supportedLocales: L10n.all,
      locale: Locale(_initLocale()),
    );
  }

 

  Widget _buildMaterialAppBuilder(BuildContext ctx, Widget? child) {
    final prevState = ref.read(settingViewModelProvider).valueOrNull;
    final state = ref.watch(settingViewModelProvider);

    final themeColor = state.maybeWhen(
      data: (data) => ThemeColor.of(data.themeModeType),
      orElse:
          () =>
              prevState != null
                  ? ThemeColor.of(prevState.themeModeType)
                  : ThemeColor.of(ThemeModeType.main),
    );

    ScreenUtil.init(ctx);
    final themeFont = ThemeFont(context: context, color: themeColor);

    return Theme(
      data: AppTheme.of(context, themeColor, themeFont),
      child: child!,
    );
  }

  String _initLocale() {
    final prevState = ref.read(settingViewModelProvider).valueOrNull;
    final state = ref.watch(settingViewModelProvider);

    return state.maybeWhen(
      data: (data) => data.localeId,
      orElse:
          () => prevState != null ? prevState.localeId : LocaleIdConstant.ID,
    );
  }
}
