

import 'package:chef_app/core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubits/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import 'change_languge_bottom_sheet.dart';
import 'line_widget.dart';

class AccountSettingsContainer extends StatelessWidget {
  const AccountSettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
  builder: (context, state) {
    var settingsCubit=BlocProvider.of<SettingsCubit>(context);
    return BlocBuilder<ChangeLanguageAndThemeCubit, ChangeLanguageAndThemeState>(
  builder: (context, state) {
    var changeLanguageAndThemeCubit = BlocProvider.of<ChangeLanguageAndThemeCubit>(context);
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
          Text('Account Settings',style: AppTextStyles.bold20(context).copyWith(color: AppColors.c181C2E),),
          SpaceWidget(height: 5,),
          GestureDetector(
            onTap: ()
            {
              showModalBottomSheet(
                backgroundColor: AppColors.transparent,
                context: context,
                builder: (context) => ChangeLanguageBottomSheet(),);
            },
            child: ListTile(
              title: Text('Language',style: AppTextStyles.bold15(context).copyWith(
                  color: AppColors.c32343E
              ),),
              subtitle: Text('Allows to switch between english\nand arabic as you prefer',style: AppTextStyles.regular13(context).copyWith(
                  color: AppColors.cA0A5BA
              ),),
              contentPadding: EdgeInsetsDirectional.zero,
            ),
          ),
          SpaceWidget(height: 10,),
          LineWidget(
            color: AppColors.cF3F3F3,
            height: 3,
          ),
          ListTile(
            title: Text('Change Password',style: AppTextStyles.bold15(context).copyWith(
                color: AppColors.c32343E
            ),),
            subtitle: Text('Allows to change your current password whenever you want',style: AppTextStyles.regular13(context).copyWith(
                color: AppColors.cA0A5BA
            ),),
            contentPadding: EdgeInsetsDirectional.zero,
          ),
          SpaceWidget(height: 10,),
          LineWidget(
            color: AppColors.cF3F3F3,
            height: 3,
          ),
          ListTile(
            title: Text('Dark Mode',style: AppTextStyles.bold15(context).copyWith(
                color: AppColors.c32343E
            ),),
            subtitle: Text('Allows to switch between light and dark mode as you prefer',style: AppTextStyles.regular13(context).copyWith(
                color: AppColors.cA0A5BA
            ),),
            contentPadding: EdgeInsetsDirectional.zero,
            trailing: Switch(
                value: CacheHelper().getData(key: ApiKeys.darkModeIsActive)!=null?CacheHelper().getData(key: ApiKeys.darkModeIsActive):settingsCubit.isDarkModeActive,
                trackOutlineColor: WidgetStatePropertyAll(
                    AppColors.cC4C4C4
                ),
                thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
                activeTrackColor: AppColors.primaryColor,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.cC4C4C4,
                onChanged: (value)
                {
                  settingsCubit.onDarkModeSwitched(value: value);
                  changeLanguageAndThemeCubit.changeCurrentTheme(darkModeIsActive: value);
                }),
          ),


        ],
      ),
    );
  },
);
  },
);
  }
}
