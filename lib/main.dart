
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/injection/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chef_app.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
   setUpLocator();
  runApp(const ChefsApp());
  Bloc.observer = MyBlocObserver();
}



