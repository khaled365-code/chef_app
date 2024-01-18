

import 'package:chef_app/features/auth/presentation/screens/change_language_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/settings_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes
{

  static const String splash='/';
  static const String changeLanguageScreen='/change_language';
  static const String loginScreen='/login_screen';
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
        return MaterialPageRoute(builder: (context) => SplashScreen(),);
      case Routes.changeLanguageScreen:
        return MaterialPageRoute(builder: (context) => ChangeLanguageScreen(),);
        case Routes.loginScreen:
      return MaterialPageRoute(builder: (context) => LoginScreen(),);
      case Routes.resetPasswordScreen:
      return MaterialPageRoute(builder: (context) => ResetPasswordScreen(),);
      case Routes.sendCodeScreen:
      return MaterialPageRoute(builder: (context) => SendCodeScreen(),);
      case Routes.addMealScreen:
      return MaterialPageRoute(builder: (context) => AddMealScreen(),);
      case Routes.menuScreen:
      return MaterialPageRoute(builder: (context) => MenueScreen(),);
      case Routes.changePasswordScreen:
      return MaterialPageRoute(builder: (context) => ChangePasswordScreen(),);
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen(),);
        case Routes.settingsScreen:
      return MaterialPageRoute(builder: (context) => SettingsScreen(),);
      case Routes.updateProfileScreen:
      return MaterialPageRoute(builder: (context) => UpdateProfileScreen(),);
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('No Route Found')),),);
    }



  }



}