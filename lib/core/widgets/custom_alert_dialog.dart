

import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key, required this.confirmPressed, this.buttonsWidth=100, this.buttonsheight=50, this.sizedBoxBetweenButtons=20,required this.subTitle
  });

  final void Function() confirmPressed;
  final double? buttonsWidth;
  final double? buttonsheight;
  final double? sizedBoxBetweenButtons;
  final String subTitle;








  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.black,
      icon: Icon(Icons.warning_amber_outlined  ,size: 50,color: AppColors.grey,),
      content: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
          [
            SizedBox(height: 20,),
            Center(child: Text(subTitle,style: AppTextStyles.font16.copyWith(color: AppColors.white))),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SharedButton(text: S.of(context).ok, width: buttonsWidth!, height: buttonsheight!, textStyle: AppTextStyles.font16.copyWith(color: AppColors.white), buttonColor: AppColors.primary,onPressed: confirmPressed,),
                SizedBox(width: sizedBoxBetweenButtons,),
                SharedButton(text: S.of(context).cancel, width: buttonsWidth!, height: buttonsheight!, textStyle: AppTextStyles.font16.copyWith(color: AppColors.white), buttonColor: AppColors.primary,onPressed:(){
                  Navigator.pop(context);
                } ,),
              ],
            )


          ],
        ),
      ),

    );
  }
}

/*
actions:
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SharedButton(text: S.of(context).ok, width: buttonsWidth!, height: buttonsheight!, textStyle: AppTextStyles.font16.copyWith(color: AppColors.white), buttonColor: AppColors.primary,borderRadius: BorderRadius.circular(16),onPressed: confirmPressed),
            SizedBox(width: sizedBoxBetweenButtons,),
            SharedButton(text: S.of(context).cancel, width: buttonsWidth!, height: buttonsheight!, textStyle: AppTextStyles.font16.copyWith(color: AppColors.white), buttonColor: AppColors.grey.withOpacity(.7),borderRadius: BorderRadius.circular(16),onPressed: (){
              Navigator.pop(context);
            } ,)

          ],
        )
      ],
 */