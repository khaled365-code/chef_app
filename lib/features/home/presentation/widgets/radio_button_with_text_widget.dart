


import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class RadioButtonWithTextWidget extends StatelessWidget {
  const RadioButtonWithTextWidget({super.key, required this.text, required this.containerIsSelected});


  final String text;
  final bool containerIsSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          width: 24.w,
          height: 24.h,
          padding: EdgeInsetsDirectional.all(4.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.cAFAFAF),
          ),
          child: Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              color: containerIsSelected==true? AppColors.primaryColor:AppColors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SpaceWidget(width: 11,),
        Text(text,style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E),)
      ],
    );
  }
}
