

import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class OptionsForAccountWidget extends StatelessWidget {
  const OptionsForAccountWidget({super.key, required this.title1, required this.title2, this.onActionTapped});

  final String title1,title2;
  final void Function()? onActionTapped;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title1,style: AppTextStyles.regular16(context).copyWith(color: AppColors.c646982),),
        SpaceWidget(width: 5,),
        GestureDetector(
            onTap: onActionTapped,
            child: Text(
              title2,
              style: AppTextStyles.bold14(context)
                  .copyWith(color: AppColors.primaryColor),
            )),
      ],
    );
  }
}
