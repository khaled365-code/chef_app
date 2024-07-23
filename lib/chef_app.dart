import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
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
            BlocProvider(
              create: (context) => ChangeLanguageAndThemeCubit(),
              child: BlocBuilder<ChangeLanguageAndThemeCubit, ChangeLanguageAndThemeState>(
              builder: (context, state) {
                var changeLanguageAndThemeCubit = BlocProvider.of<ChangeLanguageAndThemeCubit>(context);
                    return Builder(
                        builder: (context) {
                          return MaterialApp(
                            locale: Locale(CacheHelper().getData(key: ApiKeys.appCurrentLanguage)!=null? CacheHelper().getData(key: ApiKeys.appCurrentLanguage):changeLanguageAndThemeCubit.currentAppLanguage),
                            localizationsDelegates: [
                              S.delegate,
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
                            supportedLocales: S.delegate.supportedLocales,
                            theme: CacheHelper().getData(key: ApiKeys.darkModeIsActive)!=null?CacheHelper().getData(key: ApiKeys.darkModeIsActive)==true?ThemeData.dark():ThemeData.light():changeLanguageAndThemeCubit.currentTheme,
                            debugShowCheckedModeBanner: false,
                            initialRoute: CacheHelper().getData(
                                key: ApiKeys.token) !=
                                null
                                ? Routes.homeScreen
                                : Routes.splash2Screen,
                            onGenerateRoute: AppRouter.generateRoutes,
                          );
                        }
                    );
              },
            ),
            )
    );
  }
}