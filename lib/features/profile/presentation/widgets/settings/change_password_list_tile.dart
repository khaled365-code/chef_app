



import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import 'change_password_bottom_sheet.dart';

class ChangePasswordListTile extends StatelessWidget {
  const ChangePasswordListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        showModalBottomSheet(
          backgroundColor: AppColors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (context) => ChangePasswordBottomSheet(),);
      },
      title: Text('Change Password',style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('Allows to change your current password whenever you want',style: AppTextStyles.regular14(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      contentPadding: EdgeInsetsDirectional.zero,
    );
  }
}
