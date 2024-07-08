import 'dart:io';

import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
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
import 'chefs_app.dart';
import 'core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'core/commons/global_cubits/get_chef_meals_cubit/get_chef_meals_cubit.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'core/commons/commons.dart';
import 'generated/l10n.dart';

void main()
{
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
      child: const ChefsApp()));
  Bloc.observer = MyBlocObserver();
}
bool isArabic()
{
  return Intl.getCurrentLocale() == 'ar';
}


