

import 'package:chef_app/features/profile/presentation/widgets/settings/change_password_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'change_languge_bottom_sheet.dart';
import 'change_password_list_tile.dart';
import 'language_list_tile.dart';

class AccountSettingsContainer extends StatelessWidget {
  const AccountSettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w),
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('account_settings'),style: AppTextStyles.bold20(context).copyWith(color: AppColors.c181C2E),),
          SpaceWidget(height: 5,),
          GestureDetector(
            onTap: ()
            {
              showModalBottomSheet(
                backgroundColor: AppColors.transparent,
                context: context,
                builder: (context) => ChangeLanguageBottomSheet(),);
            },
            child: LanguageListTile(),
          ),
          Divider(
            color: AppColors.cEEF2F6,
            thickness: 3,
            height: 10,
          ),
          GestureDetector(
            onTap: ()
            {
              showModalBottomSheet(
                backgroundColor: AppColors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (context) => ChangePasswordBottomSheet(),);
            },
            child: ChangePasswordListTile(),
          ),


        ],
      ),
    );
  }
}



