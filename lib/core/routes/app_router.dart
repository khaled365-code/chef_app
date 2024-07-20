import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:chef_app/features/auth/presentation/views/forget_pass_send_code_screen.dart';
import 'package:chef_app/features/auth/presentation/views/forget_password_screen.dart';
import 'package:chef_app/features/auth/presentation/views/login_screen.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/cubits/add_meal_cubit/add_meal_cubit.dart';
import 'package:chef_app/features/home/presentation/cubits/update_meal_cubit/update_meal_cubit.dart';
import 'package:chef_app/features/home/presentation/views/add_meal_screen.dart';
import 'package:chef_app/features/home/presentation/views/home_screen.dart';
import 'package:chef_app/features/home/presentation/views/meal_details_screen.dart';
import 'package:chef_app/features/home/presentation/views/update_meal_screen.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:chef_app/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubits/get_chef_data_cubit/get_chef_data_cubit.dart';
import 'package:chef_app/features/profile/presentation/views/certification_screen.dart';
import 'package:chef_app/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:chef_app/features/profile/presentation/views/personal_info_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import '../../features/home/presentation/views/all_meals_screen.dart';
import '../../features/splash_and_onbording/presentation/views/onbaording_screen.dart';
import '../../features/splash_and_onbording/presentation/views/splash2_screen.dart';

class AppRouter {

  static Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash2Screen:
        return MaterialPageRoute(
            builder: (context) => Splash2Screen(), settings: routeSettings);


      case Routes.editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EditProfileCubit(
                      profileRepoImplementation: ProfileRepoImplementation(
                          api: DioConsumer(dio: Dio()))),
                  child: EditProfileScreen(),
                ),
            settings: routeSettings);

      case Routes.certificationScreen:
        return MaterialPageRoute(
            builder: (context) => CertificationScreen(), settings: routeSettings);

      case Routes.personalInfoScreen:
        return MaterialPageRoute(
            builder: (context) => PersonalInfoScreen(), settings: routeSettings);

      case Routes.updateMealScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => UpdateMealCubit(
                      homeRepoImplementation:
                          HomeRepoImplementation(api: DioConsumer(dio: Dio()))),
                  child: UpdateMealScreen(),
                ),
            settings: routeSettings);

      case Routes.allMealsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => HomeScreenCubit(
                      homeRepoImplementation:
                          HomeRepoImplementation(api: DioConsumer(dio: Dio())))..getAllMealsFun(),
                  child: AllMealsScreen(),
                ),
            settings: routeSettings);

      case Routes.addMealScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AddMealCubit(
                  homeRepoImplementation:
                  HomeRepoImplementation(api: DioConsumer(dio: Dio()))),
              child: AddMealScreen(),
            ),
            settings: routeSettings);
      case Routes.mealDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => MealDetailsScreen(), settings: routeSettings);

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => OnboardingScreen(), settings: routeSettings);

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => HomeScreenCubit(
                          homeRepoImplementation: HomeRepoImplementation(
                              api: DioConsumer(dio: Dio())))
                        ..getAllMealsFun(),
                    ),
                    BlocProvider(
                      create: (context) => GetChefDataCubit(
                          profileRepoImplementation: ProfileRepoImplementation(
                              api: DioConsumer(dio: Dio())))..getChefDataFun(chefIId: CacheHelper().getData(key: ApiKeys.id)),
                    ),
                  ],
                  child: HomeScreen(),
                ),
            settings: routeSettings);

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) =>
                      LoginCubit(authRepoImplementation: AuthRepoImplementation(
                          api: DioConsumer(dio: Dio()))),
                  child: LoginScreen(),
                ), settings: routeSettings);

      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => SignupCubit(authRepoImplementation: AuthRepoImplementation(api: DioConsumer(dio: Dio()))),
                  child: SignupScreen(),
                ), settings: routeSettings);

      case Routes.forgetPassScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ForgetPassCubit(
                      authRepoImplementation:
                          AuthRepoImplementation(api: DioConsumer(dio: Dio()))),
                  child: ForgetPasswordScreen(),
                ),
            settings: routeSettings);

      case Routes.forgetPassSendCodeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ForgetPassCubit(
                  authRepoImplementation:
                  AuthRepoImplementation(api: DioConsumer(dio: Dio()))),
              child: ForgetPassSendCodeScreen(),
            ),
            settings: routeSettings);
    }
  }

}