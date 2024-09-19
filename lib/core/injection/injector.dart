
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:chef_app/features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/home/presentation/cubits/add_meal_cubit/add_meal_cubit.dart';
import '../../features/home/presentation/cubits/update_meal_cubit/update_meal_cubit.dart';
import '../../features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';

GetIt locator=GetIt.instance;


setUpLocator()
{
  locator.registerLazySingleton<DioConsumer>(() =>DioConsumer(dio: Dio()),);
  locator.registerLazySingleton<HomeRepoImplementation>(() =>HomeRepoImplementation(api: locator.get<DioConsumer>()),);
  locator.registerLazySingleton<ProfileRepoImplementation>(() =>ProfileRepoImplementation(api: locator.get<DioConsumer>()));
  locator.registerLazySingleton<AuthRepoImplementation>(() =>AuthRepoImplementation(api: locator.get<DioConsumer>()),);
  
  locator.registerFactory(() => HomeScreenCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => GetSpecificChefMealsCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()));
  locator.registerFactory(() => EditProfileCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),);
  locator.registerFactory(() => UpdateMealCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => AddMealCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => LoginCubit(authRepoImplementation: locator.get<AuthRepoImplementation>()),);
  locator.registerFactory(() => SignupCubit(authRepoImplementation: locator.get<AuthRepoImplementation>()),);
  locator.registerFactory(() => ForgetPassCubit(authRepoImplementation: locator.get<AuthRepoImplementation>()),);

  
}