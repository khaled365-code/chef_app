

import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key, required this.message, required this.confirmPressed
  });

  final String message;
  final void Function() confirmPressed;




  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      icon: Icon(Icons.priority_high,size: 40),
      title: Text(message),
      actions:
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SharedButton(text: S.of(context).ok, width: 100, height: 50, textStyle: AppTextStyles.font16.copyWith(color: AppColors.white), buttonColor: AppColors.primary,borderRadius: BorderRadius.circular(16),onPressed: confirmPressed),
            SizedBox(width: 15,),
            SharedButton(text: S.of(context).cancel, width: 100, height: 50, textStyle: AppTextStyles.font16.copyWith(color: AppColors.white), buttonColor: AppColors.primary,borderRadius: BorderRadius.circular(16),onPressed: (){
              Navigator.pop(context);
            } ,)

          ],
        )
      ],
    );
  }
}