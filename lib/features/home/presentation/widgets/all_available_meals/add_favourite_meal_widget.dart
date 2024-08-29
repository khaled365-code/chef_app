

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_colors.dart';

class AddMealToFavourites extends StatelessWidget {
  const AddMealToFavourites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cF58D1D,
      ),
      child: Center(
        child: Icon(
          Icons.favorite_outline, color: AppColors.white,),
      ),
    );
  }
}
