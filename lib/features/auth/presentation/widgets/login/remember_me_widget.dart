

import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key, required this.isRemembered});

  final bool isRemembered;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ()
          {
            LoginCubit.get(context).changeCheckBoxShape();
          },
          child: Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: isRemembered==true?AppColors.primaryColor:AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                  width: 2.w,
                  color: AppColors.cE3EBF2),
            ),
            child: isRemembered==true ?FittedBox(child: Icon(Icons.check,color: AppColors.white,)):SizedBox.shrink(),
          ),
        ),
        
        SpaceWidget(width: 10,),
        Text('Remember me',style: AppTextStyles.regular13(context).copyWith(color: AppColors.c7E8A97),),
        Spacer(),
        GestureDetector(
          onTap: ()
          {
            navigate(context: context, route: Routes.forgetPassSendCodeScreen);
          },child: Text('Forgot Password',style: AppTextStyles.regular14(context).copyWith(color: AppColors.primaryColor),)),
      ],
    );
  }
}
