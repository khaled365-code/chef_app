

import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Row(
        children: [
          Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: ()
                  {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cECF0F4
                    ),
                    child: Center(child: SvgPicture.asset(
                        ImageConstants.menuIcon)),
                  ),
                );
              }
          ),
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 24.w),
            child: GestureDetector(
              onTap: ()
              {
                Navigator.pushNamed(context, Routes.allMealsScreen);

                HomeScreenCubit.get(context).getAllMealsFun();
              },
              child: Container(
                width: 45.w,
                height: 49.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.c181C2E
                ),
                child: Center(child: SvgPicture.asset(
                  ImageConstants.cartIcon,colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
