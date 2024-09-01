

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_colors.dart';

class AddMealContainerShapeToFavourites extends StatelessWidget {
  const AddMealContainerShapeToFavourites({
    super.key, required this.isActivated,
  });
  final bool isActivated;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      child: Center(
        child: Icon(
          Icons.favorite_outline, color: isActivated==true?Colors.redAccent:AppColors.c646982,),
      ),
    );
  }
}
