
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chef_app.dart';
import 'core/database/api/api_keys.dart';
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotificationsService.init();


  setUpLocator();
  runApp(const ChefsApp());
  Bloc.observer = MyBlocObserver();
}



