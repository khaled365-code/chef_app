
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'chef_app.dart';

void main()
{
  CacheHelper().init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ChefsApp());
  Bloc.observer = MyBlocObserver();
}



