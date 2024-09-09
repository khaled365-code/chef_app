


import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class TopQuestionsRow extends StatelessWidget {
  const TopQuestionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Top Questions',style: AppTextStyles.bold17(context).copyWith(
            color: AppColors.black
        ),),
        Spacer(),
        Text('View all',style: AppTextStyles.bold14(context).copyWith(
            color: AppColors.primaryColor
        )),
      ],);
  }
}
