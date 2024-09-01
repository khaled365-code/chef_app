
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:chef_app/core/utilis/services/local_database_service.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chef_app.dart';
import 'core/utilis/services/local_notifications_service.dart';
import 'core/utilis/services/push_notifications_service.dart';
import 'firebase_options.dart';





void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
   CacheHelper().init(),
   LocalNotificationsService.init(),
  ]);
  LocalDatabaseService.favouriteMealsBox=await LocalDatabaseService.openHiveBox('favourite_meals');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotificationsService.init();


  setUpLocator();
  runApp(MultiBlocProvider(
    providers: 
    [
      BlocProvider(create: (context) => HomeScreenCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>())..getAllMealsFun(),)
    ],
      child: const ChefsApp()));
  Bloc.observer = MyBlocObserver();
}



