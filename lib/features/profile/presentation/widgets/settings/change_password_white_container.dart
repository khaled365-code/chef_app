


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class ChangePasswordWhiteContainer extends StatelessWidget {
  const ChangePasswordWhiteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsetsDirectional.only(start: 15.w),
      decoration: BoxDecoration(
        color: AppColors.cFAFAFA,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'Change Password ', style: AppTextStyles.bold18(
            context).copyWith(color: AppColors.c181C2E),),
      ),
    );
  }
}
