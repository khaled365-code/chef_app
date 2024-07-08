


import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/custom_image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class HomeDrawerHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            CustomImagePickerAvatar(
              image: imageConstants.khaled,
              imageRadius: 45,
              plusPaddingRightValue: 2,
              plusPaddingBottomValue: 0,
            ),
            SizedBox(height: 21,),
            Text('Khaled Mohamed',style: AppTextStyles.font24.copyWith(color: AppColors.black),),
            SizedBox(height: 10,),
            Text('khaledmokhaled123@gmail.com',style: AppTextStyles.font14.copyWith(color: AppColors.white,fontWeight:  FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
