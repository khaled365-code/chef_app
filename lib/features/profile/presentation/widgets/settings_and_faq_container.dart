

import 'package:chef_app/core/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class SettingsAndFaqContainer extends StatelessWidget {
  const SettingsAndFaqContainer({
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
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: SvgPicture.asset(ImageConstants.faqIcon,),
              ),
            ),
            title: Text('FAQs',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
          ),
          SpaceWidget(height: 16,),
          GestureDetector(
            onTap: ()
            {
              navigate(context: context, route: Routes.mainSettingsScreen);
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
                  child: SvgPicture.asset(ImageConstants.settingsIcon,),
                ),
              ),
              title: Text('Settings',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
              trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
            ),
          ),

        ],
      ),
    );
  }
}