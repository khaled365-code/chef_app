

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class OutlinedTextField extends StatelessWidget {

  final TextInputType textInputType;
  final bool? obsecureText;
  final String hintText;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final String? Function(String?) validator;
  final Color? fillColor;
  final double? borderRadiusValue;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Color? suffixIconColor;





  const OutlinedTextField({super.key, required this.textInputType, this.obsecureText, required this.hintText, required this.controller, this.suffixIcon, this.suffixIconOnPressed, required this.validator, this.fillColor=AppColors.white, this.borderRadiusValue= 16, this.top=50, this.left=20, this.right=0, this.bottom=0, this.suffixIconColor=AppColors.black, });
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      validator: validator,

      keyboardType: textInputType,
      obscureText: obsecureText??false,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(top: top!,start: left!,bottom: bottom!,end: right!),
        hintText: hintText,
        fillColor: fillColor,
        filled: true,
        hintStyle: AppTextStyles.font16.copyWith(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue!),
          borderSide: BorderSide(
            color: AppColors.white
          )

        ),
        suffixIcon: IconButton(onPressed: suffixIconOnPressed,icon:Icon(suffixIcon,color:suffixIconColor ,size: 25,)),


      ),
    );

  }
}
