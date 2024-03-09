import 'dart:io';

import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/global_cubits/get_chef_meals_cubit/get_chef_meals_cubit.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/viewmodels/delete_account_cubit/delete_account_cubit.dart';
import 'package:chef_app/features/home/presentation/viewmodels/logout_cubit/logout_cubit.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'core/routes/routes.dart';
import 'core/utilis/commons.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => ChangeLanguageCubit(),),
        BlocProvider(create: (context) =>
            LogoutCubit(homeRepoImplementation: HomeRepoImplementation(
                api: DioConsumer(dio: Dio()))),),
        BlocProvider(create: (context) =>
            GetChefMealsCubit(menueRepoImplementation: MenueRepoImplementation(
                api: DioConsumer(dio: Dio()))),),
        BlocProvider(create: (context) => DeleteAccountCubit(homeRepoImplementation: HomeRepoImplementation(api: DioConsumer(dio: Dio())))),
      ],
      child: const ChefApp()));
  Bloc.observer = MyBlocObserver();
}

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  // This widget is the root of your application.
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
                          onGenerateRoute: AppRoutes.generateRoutes,
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

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}


