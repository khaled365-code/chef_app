

import 'package:chef_app/core/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: AppColors.cE3EBF2),
          ),
        ),
        SizedBox(width: 10.w,),
        Text('Remember me',style: AppTextStyles.regular13(context).copyWith(color: AppColors.c7E8A97),),
        Spacer(),
        GestureDetector(
          onTap: ()
          {
            navigate(context: context, route: Routes.forgetPassScreen);
          },child: Text('Forgot Password',style: AppTextStyles.regular14(context).copyWith(color: AppColors.primaryColor),)),
      ],
    );
  }
}
