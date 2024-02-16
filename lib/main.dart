import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/global_cubits/change_language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'core/routes/routes.dart';
import 'generated/l10n.dart';

void main() {
  runApp(BlocProvider(create: (BuildContext context) => ChangeLanguageCubit(),
      child: const ChefApp()));
  Bloc.observer=MyBlocObserver();
}

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) =>
          BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
            builder: (context, state) {
              return MaterialApp(
                
                locale: Locale(BlocProvider.of<ChangeLanguageCubit>(context).langCode),
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                theme: ThemeData.light(),
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splash,
                onGenerateRoute: AppRoutes.generateRoutes,
              );
            },
          ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}


