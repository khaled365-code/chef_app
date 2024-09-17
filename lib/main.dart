
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/meals.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'meal_time.dart';
import 'core/commons/global_models/local_notifications_model.dart';
import 'core/database/api/api_keys.dart';
import 'core/utilis/services/local_notifications_service.dart';
import 'core/utilis/services/push_notifications_service.dart';
import 'features/home/data/models/get_meals_model/chef_data.dart';
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
  Hive.registerAdapter(MealsAdapter());
  Hive.registerAdapter(ChefDataAdapter());
  Hive.registerAdapter(LocalNotificationsModelAdapter());
  await Future.wait([
   Hive.openBox<Meals>('favourite_meals'),
   Hive.openBox<Meals>('history_meals'),
   Hive.openBox<LocalNotificationsModel>('cached_local_notifications'),
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotificationsService.init();

  setUpLocator();

  runApp(MultiBlocProvider(
    providers: 
    [
      BlocProvider(create: (context) => HomeScreenCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>())..getAllMealsFun()..getChefDataFun(chefIId: CacheHelper().getData(key: ApiKeys.id))..getUserAddressFun(),),
    ],
      child: EasyLocalization(
          supportedLocales: [ Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale(CacheHelper().getData(key: ApiKeys.appCurrentLanguage)??'en'),
          child: const MealTimeApp())));
  Bloc.observer = MyBlocObserver();
}



