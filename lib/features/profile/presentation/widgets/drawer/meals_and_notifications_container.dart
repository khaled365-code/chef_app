

import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/commons/global_models/local_notifications_model.dart';
import 'package:chef_app/core/utilis/services/local_notifications_service.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

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
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            onTap: ()
            {
              navigate(context: context, route: Routes.specificChefMealsScreen);
            },
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: SvgPicture.asset(ImageConstants.mealsProfileIcon,colorFilter: ColorFilter.mode(AppColors.c369BFF, BlendMode.srcIn),),
              ),
            ),
            title: Text('Get Your Meals',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
          ),
          SpaceWidget(height: 16,),
          ListTile(
            onTap: () async
            {

              HomeScreenCubit.get(context).getAllCachedNotificationsFun();
              navigate(context: context, route: Routes.notificationsScreen);
            },
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
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