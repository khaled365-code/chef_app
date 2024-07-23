


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/features/profile/presentation/cubits/settings_cubit/settings_cubit.dart';
import 'package:chef_app/features/profile/presentation/widgets/line_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class GeneralSettingsContainer extends StatelessWidget {
  const GeneralSettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
  builder: (context, state) {
    var settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Container(
      padding: EdgeInsetsDirectional.all(10.w),
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceWidget(height: 10,),
          Text('General Settings',style: AppTextStyles.bold20(context).copyWith(color: AppColors.c181C2E),),
          SpaceWidget(height: 16,),
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                    image: CacheHelper().getData(key: ApiKeys.profilePic)!=null?
                    DecorationImage(
                        image: CachedNetworkImageProvider(
                            CacheHelper().getData(key: ApiKeys.profilePic)
                        ), fit: BoxFit.fill):
                    DecorationImage(
                        image: AssetImage(ImageConstants.userDefaultImage),
                        fit: BoxFit.fill)

                ),
              ),
              SpaceWidget(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(CacheHelper().getData(key: ApiKeys.name),
                    style: AppTextStyles.bold15(context).copyWith(
                        color: AppColors.c32343E),),
                  SpaceWidget(height: 3,),
                  Text('Edit your profile',
                    style: AppTextStyles.regular13(context).copyWith(
                        color: AppColors.cA0A5BA),),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: ()
                {

                },
                child: Container(
                  width: 60.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(25.r)
                  ),
                  child: Center(
                      child: Text(
                        'Edit',
                        style: AppTextStyles.bold14(context).copyWith(
                          color: AppColors.white
                        ),
                      ),
                    )),
              )
            ],
          ),
          SpaceWidget(height: 15,),
          LineWidget(
            color: AppColors.cF3F3F3,
            height: 3,
          ),
          SpaceWidget(height: 10,),
          ListTile(
            title: Text('Location Settings',style: AppTextStyles.bold15(context).copyWith(
              color: AppColors.c32343E
            ),),
            subtitle: Text('Allow fetch to use the location services on your device',style: AppTextStyles.regular13(context).copyWith(
                color: AppColors.cA0A5BA
            ),),
            contentPadding: EdgeInsetsDirectional.zero,
            trailing: Switch(
                value: CacheHelper().getData(key: ApiKeys.locationIsActive)!=null?CacheHelper().getData(key: ApiKeys.locationIsActive):settingsCubit.locationIsActive,
                 trackOutlineColor: WidgetStatePropertyAll(
                   AppColors.cC4C4C4
                 ),
                 thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
                activeTrackColor: AppColors.primaryColor,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.cC4C4C4,
                onChanged: (value)
                {
                  settingsCubit.onLocationSwitched(value: value);
                }),
          ),
          SpaceWidget(height: 10,),
          LineWidget(
            color: AppColors.cF3F3F3,
            height: 3,
          ),
          SpaceWidget(height: 10,),
          ListTile(
            title: Text('Notifications',style: AppTextStyles.bold15(context).copyWith(
                color: AppColors.c32343E
            ),),
            subtitle: Text('Allow fetch to send notifications to your device',style: AppTextStyles.regular13(context).copyWith(
                color: AppColors.cA0A5BA
            ),),
            contentPadding: EdgeInsetsDirectional.zero,
            trailing: Switch(
                value: CacheHelper().getData(key: ApiKeys.notificationIsActive)!=null?CacheHelper().getData(key: ApiKeys.notificationIsActive):settingsCubit.notificationIsActive,
                trackOutlineColor: WidgetStatePropertyAll(
                    AppColors.cC4C4C4
                ),
                thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
                activeTrackColor: AppColors.primaryColor,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.cC4C4C4,
                onChanged: (value){
                  settingsCubit.onNotificationSwitched(value: value);
                }),
          )


        ],
      ),
    );
  },
);
  }
}
