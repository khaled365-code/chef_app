
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt.instance;


void setUpLocator()
{
  locator.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

  locator.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(api: locator.get<DioConsumer>()));

  locator.registerSingleton<ProfileRepoImplementation>(ProfileRepoImplementation(api: locator.get<DioConsumer>()));

  locator.registerSingleton<AuthRepoImplementation>(AuthRepoImplementation(api: locator.get<DioConsumer>()));

}