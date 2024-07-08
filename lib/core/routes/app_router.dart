

import 'package:chef_app/core/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/change_language_screen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/reset_password_screen.dart';
import '../../features/auth/presentation/views/send_code_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/auth/presentation/views/splash_screen.dart';
import '../../features/auth/presentation/views/start_screen.dart';
import '../../features/home/presentation/views/change_password_screen.dart';
import '../../features/home/presentation/views/faq_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/home/presentation/views/privacy_policy_screen.dart';
import '../../features/home/presentation/views/settings_screen.dart';
import '../../features/home/presentation/views/update_profile_screen.dart';
import '../../features/menu/presentation/screens/add_meal_screen.dart';
import '../../features/menu/presentation/screens/menu_screen.dart';

class AppRouter
{

  static Route? generateRoutes(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen(),settings: routeSettings);
      case Routes.startScreen:
        return MaterialPageRoute(builder: (context) => StartScreen(),settings: routeSettings);
      case Routes.changeLanguageScreen:
        return MaterialPageRoute(builder: (context) => ChangeLanguageScreen(),settings: routeSettings);
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen(),settings: routeSettings);
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ResetPasswordScreen(),settings: routeSettings);
      case Routes.sendCodeScreen:
        return MaterialPageRoute(builder: (context) => SendCodeScreen(),settings: routeSettings);
      case Routes.addMealScreen:
        return MaterialPageRoute(builder: (context) => AddMealScreen(),settings: routeSettings);
      case Routes.menuScreen:
        return MaterialPageRoute(builder: (context) => MenueScreen(),settings: routeSettings);
      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (context) => ChangePasswordScreen(),settings: routeSettings);
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (context) => SettingsScreen(),settings: routeSettings);
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (context) => UpdateProfileScreen(),settings: routeSettings);
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen(),settings: routeSettings);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen(),settings: routeSettings);
      case Routes.privacyScreen:
        return MaterialPageRoute(builder: (context) => PrivacyPolicyScreen(),settings: routeSettings);
      case Routes.faqScreen:
        return MaterialPageRoute(builder: (context) => FaqScreen(),settings: routeSettings);
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('No Route Found')),),);
    }



  }



}