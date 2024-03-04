



import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class TwoChoicesAlertDialog extends StatelessWidget

{

  final String titleText;
  final String choice1Text;
  final String choice2Text;
  final void Function() onPressedChoice1;
  final void Function() onPressedChoice2;

  const TwoChoicesAlertDialog({
    super.key, required this.titleText, required this.choice1Text, required this.choice2Text, required this.onPressedChoice1, required this.onPressedChoice2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Center(child: Text(titleText, style: AppTextStyles.font24.copyWith(color: AppColors.black))),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:
        [
          TextButton(
              onPressed: onPressedChoice1,
              child: Text(choice1Text,
                  style: AppTextStyles.font16.copyWith(color: AppColors.primary))),
          Divider(
              thickness: 2,
              indent: 1,
              endIndent: 1,
              color: AppColors.grey),
          TextButton(
              onPressed: onPressedChoice2,
              child: Text(choice2Text,
                  style: AppTextStyles.font16.copyWith(color: AppColors.primary))),
        ],
      ),
    );
  }
}