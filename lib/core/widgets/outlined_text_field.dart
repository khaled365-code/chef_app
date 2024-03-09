

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class OutlinedTextField extends StatelessWidget {

  final TextInputType textInputType;
  final bool? obsecureText;
  final String? hintText;
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
  final BorderSide? borderSide;
  final Color? hintColor;




  const OutlinedTextField({super.key, required this.textInputType, this.obsecureText,  this.hintText=' ', required this.controller, this.suffixIcon, this.suffixIconOnPressed, required this.validator, this.fillColor=AppColors.white, this.borderRadiusValue= 16, this.top=50, this.left=20, this.right=0, this.bottom=0, this.suffixIconColor=AppColors.black, this.borderSide=BorderSide.none, this.hintColor=AppColors.grey, });
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
        hintStyle: AppTextStyles.font16.copyWith(color: hintColor,fontWeight: FontWeight.normal),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue!),
          borderSide: borderSide!
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue!),
            borderSide: borderSide!
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue!),
          borderSide: borderSide!
      ),
        suffixIcon: IconButton(onPressed: suffixIconOnPressed,icon:Icon(suffixIcon,color:suffixIconColor ,size: 25,)),


      ),
    );

  }
}
