
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/app_colors.dart';


class SharedButton extends StatelessWidget {
  const SharedButton({super.key, required this.btnText, this.btnTextStyle, this.borderRadiusValue, this.btnColor, this.btnSize, this.onPressessed,});

  final String btnText;
  final TextStyle? btnTextStyle;
  final double? borderRadiusValue;
  final WidgetStateProperty<Color?>? btnColor;
  final WidgetStateProperty<Size?>? btnSize;
  final void Function()? onPressessed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
        fixedSize: btnSize??WidgetStatePropertyAll(Size(327.w, 62.h)),
        backgroundColor: btnColor??WidgetStatePropertyAll(AppColors.primaryColor),
        shape: WidgetStatePropertyAll(
           RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue??12),

          ),
        )
      ),
        onPressed: onPressessed, child: Text(btnText,style: btnTextStyle??AppTextStyles.bold14(context).copyWith(
      color: Color(0xffFFFFFF),
    ),));
  }
}
