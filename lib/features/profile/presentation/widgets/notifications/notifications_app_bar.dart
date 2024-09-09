



import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class NotificationsAppBar extends StatelessWidget {
  const NotificationsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: Center(
              child: SvgPicture.asset(
                  width: 8, ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
            ),
          ),
        ),
        SpaceWidget(width: 16,),
        Text(
          'Notifications', style: AppTextStyles.regular17(
            context).copyWith(color: AppColors.c181C2E),),
        Spacer(),
        GestureDetector(
          onTap: ()
          {
            HomeScreenCubit.get(context).clearAllLocalNotifications();
          },
            child: Text('Clear all',style: AppTextStyles.regular14(context).copyWith(color: AppColors.primaryColor))),
      ],
    );;
  }
}
