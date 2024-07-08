

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/commons/commons.dart';
import 'core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'core/commons/global_cubits/get_chef_meals_cubit/get_chef_meals_cubit.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'features/home/presentation/viewmodels/delete_account_cubit/delete_account_cubit.dart';
import 'features/home/presentation/viewmodels/logout_cubit/logout_cubit.dart';
import 'generated/l10n.dart';

class ChefsApp extends StatelessWidget {
  const ChefsApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) =>
          BlocListener<DeleteAccountCubit, DeleteAccountState>(
            listener: (context, state) async
            {
              if(state is DeleteAccountSuccessState)
              {
                await CacheHelper().clearData();
                exit(0);
              }
              else if (State is DeleteAccountFailureState )
              {
                showToast(msg: state.errorMessage, toastStates: ToastStates.error);
              }
            },
            child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
              builder: (context, state) {
                return BlocConsumer<LogoutCubit, LogoutState>(
                  listener: (context, state) async
                  {
                    if (state is LogoutSuccessState) {
                      await CacheHelper().clearData();
                      exit(0);
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<GetChefMealsCubit, GetChefMealsState>(
                      builder: (context, state) {
                        return MaterialApp(

                          locale: Locale(BlocProvider
                              .of<ChangeLanguageCubit>(context)
                              .langCode),
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
                          onGenerateRoute: AppRouter.generateRoutes,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
    );
  }
}