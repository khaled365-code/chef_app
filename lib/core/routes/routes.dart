






import 'package:chef_app/features/auth/presentation/views/screens/change_language_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/signup_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/splash_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/start_screen.dart';
import 'package:chef_app/features/home/presentation/views/screens/faq_screen.dart';
import 'package:chef_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:chef_app/features/home/presentation/views/screens/privacy_policy_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/views/screens/change_password_screen.dart';
import '../../features/home/presentation/views/screens/settings_screen.dart';
import '../../features/home/presentation/views/screens/update_profile_screen.dart';


class Routes
{

  static const String splash='/';
  static const String startScreen='/start_screen';
  static const String changeLanguageScreen='/change_language';
  static const String loginScreen='/login_screen';
  static const String signUpScreen='/signUp_screen';
  static const String homeScreen='/home_screen';
  static const String resetPasswordScreen='/reset_password';
  static const String sendCodeScreen='/send_code';
  static const String addMealScreen='/add_meal';
  static const String menuScreen='/menu';
  static const String changePasswordScreen='/change_password';
  static const String settingsScreen='/settings';
  static const String updateProfileScreen='/update_profile';
  static const String privacyScreen='/privacy_screen';
  static const String faqScreen='/faq_screen';







}
class AppRoutes
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