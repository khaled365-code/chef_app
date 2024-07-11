

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Don\'t have an account?',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c646982),),
        SizedBox(width: 5.w,),
        GestureDetector(
            onTap: () {
              navigate(context: context, route: Routes.signUpScreen);
            },
            child: Text(
              ' Sign up',
              style: AppTextStyles.bold14(context)
                  .copyWith(color: AppColors.primaryColor),
            )),
      ],
    );
  }
}
