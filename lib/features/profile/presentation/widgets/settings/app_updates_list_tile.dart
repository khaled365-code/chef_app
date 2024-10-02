


import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/features/profile/presentation/cubits/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_colors.dart';

class AppUpdatesListTile extends StatelessWidget {
  const AppUpdatesListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.zero,
      title: Text('App updates',style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('Allows to get all updates and new features',style: AppTextStyles.regular13(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      trailing: Switch(
          value:
          SettingsCubit.get(context).appUpdateIsActive,
          onChanged: (value)
          {
            SettingsCubit.get(context).switchOnAppUpdatesFun(value: value);
          },
        trackOutlineColor: WidgetStatePropertyAll(
            AppColors.cC4C4C4
        ),
        thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
        activeTrackColor: AppColors.primaryColor,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.cC4C4C4,
      ),
    );
  }
}
