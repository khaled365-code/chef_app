


import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class HeaderBodyItem extends StatelessWidget {


  final IconData icon;
  final String text;
  final void Function() onTap;
  final double? sizedBoxWidth;
  final Color? iconColor;
  final Color? textColor;

  const HeaderBodyItem({super.key, required this.icon, required this.text, required this.onTap, this.sizedBoxWidth=10, this.iconColor=AppColors.profileIconsColor, this.textColor=AppColors.black});
  @override
  Widget build(BuildContext context)
  {

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children:
        [
          Icon(icon,color: iconColor,),
          SizedBox(width: sizedBoxWidth,),
          Text(text,style: AppTextStyles.font16.copyWith(color: textColor,),)
        ],
      ),
    );
  }
}
