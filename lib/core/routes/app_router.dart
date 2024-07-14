import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:chef_app/features/auth/presentation/views/login_screen.dart';
import 'package:chef_app/features/home/presentation/views/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/splash_and_onbording/presentation/views/onbaording_screen.dart';
import '../../features/splash_and_onbording/presentation/views/splash2_screen.dart';

class AppRouter {

  static Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash2Screen:
        return MaterialPageRoute(
            builder: (context) => Splash2Screen(), settings: routeSettings);

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => OnboardingScreen(), settings: routeSettings);

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: routeSettings);

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
    }
  }

}