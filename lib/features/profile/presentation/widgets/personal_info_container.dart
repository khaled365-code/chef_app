

import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class PersonalInfoContainer extends StatelessWidget {
  const PersonalInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Padding(
        padding:  EdgeInsetsDirectional.only(top: 20.h,start: 20.w,bottom: 20.h),
        child: Column(
          children:
          [
            ListTile(
              leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Padding(
                    padding: EdgeInsetsDirectional.all(11.w),
                child: SvgPicture.asset(ImageConstants.personProfileIcon),),
              ),
              title: Text('Full Name',style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
              subtitle: Text(CacheHelper().getData(key: ApiKeys.name),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),
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
                  padding: EdgeInsetsDirectional.all(11.w),
                  child: SvgPicture.asset(ImageConstants.emailProfileIcon),),
              ),
              title: Text('Email',style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
              subtitle: FittedBox(child: Text(CacheHelper().getData(key: ApiKeys.email),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,))),
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
                  padding: EdgeInsetsDirectional.all(11.w),
                  child: SvgPicture.asset(ImageConstants.phoneProfileIcon),),
              ),
              title: Text('Phone Number',style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
              subtitle: Text(CacheHelper().getData(key: ApiKeys.phone),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),
            ),









          ],
        ),
      ),
    );
  }
}
