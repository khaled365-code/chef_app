




import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_colors.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    delay();
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.only(top: 310),
                child: Image.asset(AppAssets.foodhub),
              ),
              SizedBox(height: 250,),
              Image.asset(AppAssets.splashdivider)
            ],
          ),
        ),


      ),
    );
  }

  delay()
  {
     Future.delayed(Duration(seconds: 5),()
    {
      navigate(context: context, route: Routes.startScreen);
    },);

  }
}
