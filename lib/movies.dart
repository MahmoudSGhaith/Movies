import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/provider/language_provider.dart';
import 'package:provider/provider.dart';

import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'l10n/app_localizations.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      builder: (context, child) {
        var provider = Provider.of<LanguageProvider>(context);
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darkTheme,
              routes: AppRoutes.routes,
              //initialRoute: AppRoutes.onBoarding1,
              initialRoute: AppRoutes.loginScreen,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: [
                Locale('en'),
                Locale('ar'),
              ],
              locale: Locale(provider.currentLanguage),
            );
          },
        );
      },
    );
  }
}
