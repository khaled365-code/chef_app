




import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: Column(
          children:
          [
            Spacer(),
            Center(child: Image.asset(imageConstants.rectangle)),
            Spacer(),
            Image.asset(imageConstants.splashdivider),
            SizedBox(height: 16.h,),
          ],
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
