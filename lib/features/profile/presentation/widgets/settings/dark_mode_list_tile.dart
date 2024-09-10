


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/commons/global_cubits/change_language_cubit/change_theme_cubit.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../cubits/settings_cubit/settings_cubit.dart';

class DarkModeListTile extends StatelessWidget {
  const DarkModeListTile({
    super.key,
    required this.settingsCubit,
    required this.changeLanguageAndThemeCubit,
  });

  final SettingsCubit settingsCubit;
  final ChangeThemeCubit changeLanguageAndThemeCubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Dark Mode',style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('Allows to switch between light and dark mode as you prefer',style: AppTextStyles.regular14(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      contentPadding: EdgeInsetsDirectional.zero,
      trailing: Switch(
          value: CacheHelper().getData(key: ApiKeys.darkModeIsActive)!=null?
          CacheHelper().getData(key: ApiKeys.darkModeIsActive):
          settingsCubit.isDarkModeActive,
          trackOutlineColor: WidgetStatePropertyAll(
              AppColors.cC4C4C4
          ),
          thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
          activeTrackColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.cC4C4C4,
          onChanged: (value) async
          {
            await settingsCubit.onDarkModeSwitched(value: value);
            ChangeThemeCubit.get(context).changeCurrentTheme(darkModeIsActive: value);
          }),
    );
  }
}
