

import 'package:chef_app/core/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class MealsAndNotificationsContainer extends StatelessWidget {
  const MealsAndNotificationsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w),
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: ()
            {
              navigate(context: context, route: Routes.specificChefMealsScreen);
            },
            child: ListTile(
              leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: SvgPicture.asset(ImageConstants.mealsProfileIcon,colorFilter: ColorFilter.mode(AppColors.c369BFF, BlendMode.srcIn),),
                ),
              ),
              title: Text('Get Chef Meals',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
              trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
            ),
          ),
          SpaceWidget(height: 16,),
          ListTile(
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: SvgPicture.asset(ImageConstants.notificationsProfileIcon,colorFilter: ColorFilter.mode(AppColors.cB33DFB, BlendMode.srcIn),),
              ),
            ),
            title: Text('Notifications',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
          ),


        ],
      ),
    );
  }
}