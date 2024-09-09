

import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/custom_outline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaqSearchField extends StatelessWidget {
  const FaqSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlineTextField(
        controller: TextEditingController(),
      prefixIcon: Padding(
        padding:  EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
        child: Icon(FontAwesomeIcons.magnifyingGlass,size: 23.sp,),
      ),
      contentPadding: EdgeInsetsDirectional.only(top: 9.h),
      fillColor: AppColors.cF5F5F5,
      hintText: 'Enter your keyword',
      hintStyle: AppTextStyles.regular14(context).copyWith(color: AppColors.c757575),
      borderRadius: BorderRadius.circular(8.r),



    );
  }
}
