import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:chef_app/features/auth/presentation/views/forget_pass_change_screen.dart';
import 'package:chef_app/features/auth/presentation/views/send_code_screen.dart';
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
import 'package:chef_app/features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubits/settings_cubit/settings_cubit.dart';
import 'package:chef_app/features/profile/presentation/views/certification_screen.dart';
import 'package:chef_app/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:chef_app/features/profile/presentation/views/main_settings_screen.dart';
import 'package:chef_app/features/profile/presentation/views/personal_info_screen.dart';
import 'package:chef_app/features/profile/presentation/views/specific_chef_meals_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home/presentation/views/all_meals_screen.dart';
import '../../features/home/presentation/views/favourites_screen.dart';
import '../../features/splash_and_onbording/presentation/views/onbaording_screen.dart';
import '../../features/splash_and_onbording/presentation/views/splash2_screen.dart';
import '../injection/injector.dart';

class AppRouter {

  static Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash2Screen:
        return MaterialPageRoute(
            builder: (context) => Splash2Screen(), settings: routeSettings);

      case Routes.favouritesScreen:
        return MaterialPageRoute(
            builder: (context) => FavouritesScreen(),
            settings: routeSettings);

      case Routes.mainSettingsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SettingsCubit(),
                  child: MainSettingsScreen(),
                ),
            settings: routeSettings);

      case Routes.specificChefMealsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
  create: (context) => GetSpecificChefMealsCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>())..getSpecificChefMealsFun(chefId: CacheHelper().getData(key: ApiKeys.id)),
  child: SpecificChefMealsScreen(),
), settings: routeSettings);


      case Routes.editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EditProfileCubit(
                      profileRepoImplementation: locator.get<ProfileRepoImplementation>()
                  ),
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
                    homeRepoImplementation: locator.get<HomeRepoImplementation>()
                  ),
                  child: UpdateMealScreen(),
                ),
            settings: routeSettings);

      case Routes.allMealsScreen:
        return MaterialPageRoute(
            builder: (context) => AllMealsScreen(),
            settings: routeSettings);

      case Routes.addMealScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AddMealCubit(
                 homeRepoImplementation: locator.get<HomeRepoImplementation>()),
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
            builder: (context) => HomeScreen(),
            settings: routeSettings);

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) =>
                      LoginCubit(
                        authRepoImplementation: locator.get<AuthRepoImplementation>()
                      ),
                  child: LoginScreen(),
                ), settings: routeSettings);

      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => SignupCubit(
                      authRepoImplementation: locator.get<AuthRepoImplementation>()
                  ),
                  child: SignupScreen(),
                ), settings: routeSettings);

      case Routes.forgetPassSendCodeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ForgetPassCubit(
                      authRepoImplementation: locator.get<AuthRepoImplementation>()

                  ),
                  child: ForgetPasswordSendCodeScreen(),
                ),
            settings: routeSettings);

      case Routes.forgetPassChangeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ForgetPassCubit(
                  authRepoImplementation: locator.get<AuthRepoImplementation>()
              ),
              child: ForgetPassChangeScreen(),
            ),
            settings: routeSettings);
    }
  }

}