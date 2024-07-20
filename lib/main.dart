
import 'package:chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chef_app.dart';
import 'core/database/api/dio_consumer.dart';
import 'features/profile/data/repos/profile_repo_implementation.dart';
import 'features/profile/presentation/cubits/get_chef_data_cubit/get_chef_data_cubit.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const ChefsApp());
  Bloc.observer = MyBlocObserver();
}



