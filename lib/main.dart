import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:chef_app/core/utilis/services/internet_connection_service.dart';
import 'package:chef_app/core/utilis/services/work_manager_service.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/system_all_meals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/profile/data/models/specific_chef_meals_model/chef_meals.dart';
import 'meal_time.dart';
import 'core/commons/global_models/local_notifications_model.dart';
import 'core/database/api/api_keys.dart';
import 'core/utilis/services/local_notifications_service.dart';
import 'features/home/data/models/get_meals_model/chef_info.dart';
import 'firebase_options.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    CacheHelper().init(),
    LocalNotificationsService.init(),
    Hive.initFlutter(),

  ]);
  Hive.registerAdapter(SystemMealsAdapter());
  Hive.registerAdapter(ChefDataAdapter());
  Hive.registerAdapter(LocalNotificationsModelAdapter());
  Hive.registerAdapter(SpecificChefMealsAdapter());
  await Future.wait([
    Hive.openBox<SystemMeals>('favourite_meals'),
    Hive.openBox<SystemMeals>('history_meals'),
    Hive.openBox<SystemMeals>('cached_system_meals'),
    Hive.openBox<SpecificChefMeals>('cached_chef_meals'),
    Hive.openBox<LocalNotificationsModel>('cached_local_notifications'),
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpLocator();

  runApp(
      EasyLocalization(
          supportedLocales: [ Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: Locale(
              CacheHelper().getData(key: ApiKeys.appCurrentLanguage) ?? 'en'),
          child: const MealTimeApp()));
  Bloc.observer = MyBlocObserver();
}



