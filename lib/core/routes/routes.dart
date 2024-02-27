






import 'package:chef_app/features/auth/presentation/views/screens/change_language_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/signup_screen.dart';
import 'package:chef_app/features/auth/presentation/views/screens/splash_screen.dart';
import 'package:chef_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/settings_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';


class Routes
{

  static const String splash='/';
  static const String changeLanguageScreen='/change_language';
  static const String loginScreen='/login_screen';
  static const String signUpScreen='/signUp_screen';
  static const String homeScreen='/home_screen';
  static const String resetPasswordScreen='/reset_password';
  static const String sendCodeScreen='/send_code';
  static const String addMealScreen='/add_meal';
  static const String menuScreen='/menu';
  static const String changePasswordScreen='/change_password';
  static const String profileScreen='/profile';
  static const String settingsScreen='/settings';
  static const String updateProfileScreen='/update_profile';

  


}
class AppRoutes
{

  static Route? generateRoutes(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen(),settings: routeSettings);
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
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen(),settings: routeSettings);
        case Routes.settingsScreen:
      return MaterialPageRoute(builder: (context) => SettingsScreen(),settings: routeSettings);
      case Routes.updateProfileScreen:
      return MaterialPageRoute(builder: (context) => UpdateProfileScreen(),settings: routeSettings);
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen(),settings: routeSettings);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen(),settings: routeSettings);
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('No Route Found')),),);
    }



  }



}