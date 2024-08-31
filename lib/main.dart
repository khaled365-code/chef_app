
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:chef_app/core/utilis/services/local_database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chef_app.dart';
import 'core/utilis/services/local_notifications_service.dart';
import 'core/utilis/services/push_notifications_service.dart';
import 'features/home/data/models/get_meals_model/meals.dart';
import 'firebase_options.dart';

List<Meals> ongoingFavouriteMeals=[];
List<Meals> historyMeals=[];


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
   CacheHelper().init(),
   LocalNotificationsService.init(),
  ]);
  LocalDatabaseService.appBoxCollection=await LocalDatabaseService.openCollections({'favourite_meals','cached_meals','history_meals'});
  LocalDatabaseService.appFavouritesMeals=await LocalDatabaseService.appBoxCollection!.openBox('favourite_meals');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotificationsService.init();


  setUpLocator();
  runApp(const ChefsApp());
  Bloc.observer = MyBlocObserver();
}



