

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class AllAvailableMeals extends StatelessWidget {
  const AllAvailableMeals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Text('Our meals',
          style: AppTextStyles.medium_28_Poppins(context).copyWith(
              color: AppColors.black
          )),
    );
  }
}
