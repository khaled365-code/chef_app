

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';

class AllMealsAppBar extends StatelessWidget {
  const AllMealsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cECF0F4
              ),
              child: Center(child: SvgPicture.asset(
                width: 10,
                  ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
            ),
          )),
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 24.w),
            child: GestureDetector(
              onTap: ()
              {
                navigate(context: context, route: Routes.favouritesScreen);
              },
              child: Container(
                width: 45.w,
                height: 49.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.c181C2E
                ),
                child: Center(child: Icon(
                  Icons.favorite_outline_rounded, color: AppColors.white,)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
