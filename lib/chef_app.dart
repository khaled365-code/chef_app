
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'generated/l10n.dart';

class ChefsApp extends StatelessWidget {
  const ChefsApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) =>
          MaterialApp(
            locale: Locale('en'),
            localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
                theme: ThemeData.light(),
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splash2Screen,
                onGenerateRoute: AppRouter.generateRoutes,
              )
    );
  }
}