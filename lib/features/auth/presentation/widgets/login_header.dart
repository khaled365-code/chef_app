

import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.context});

  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color(0xff1E1E2E),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft: Radius.circular(6),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*(90/812),),
              Text('Log In',style: AppTextStyles.bold30(context).copyWith(color: Color(0xffFFFFFF)),),
              Text('Please sign in to your existing account',style: AppTextStyles.regular16(context).copyWith(color: Color(0xffFFFFFF)),),

            ],
          ),
        ),
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Image.asset(ImageConstants.splashTopElipsisImage,color:Colors.white,)),
        Align(
            alignment: AlignmentDirectional.topEnd,
            child: Image.asset(ImageConstants.loginOtherElipsisImage,color:Colors.grey,)),
      ],
    );
  }
}
