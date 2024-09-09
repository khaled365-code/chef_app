

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class CustomOutlineTextField extends StatelessWidget {
  const CustomOutlineTextField({super.key, this.contentPadding, this.hintText, this.hintStyle, this.suffixIcon, this.obscureText, this.keyboardType, this.filledTextStyle, this.crusorColor, required this.controller, this.validator, this.onFieldSubmitted, this.inputFormatters, this.fieldFocusNode, this.prefixIcon, this.fillColor, this.borderRadius});

  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextStyle? filledTextStyle;
  final Color? crusorColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? fieldFocusNode;
  final Widget? prefixIcon;
  final Color? fillColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        cursorColor: crusorColor??AppColors.c1E1E2E,
        obscureText: obscureText??false,
        keyboardType: keyboardType??TextInputType.text,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
        focusNode: fieldFocusNode,
        style: filledTextStyle??AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E),
        decoration: InputDecoration(
        hintText: hintText??'',
        hintStyle: hintStyle??AppTextStyles.regular14(context).copyWith(color: AppColors.cA0A5BA),
        contentPadding: contentPadding??EdgeInsetsDirectional.only(start: 20.w,top: 23.h),
        filled: true,
        fillColor: fillColor??AppColors.cF0F5FA,
        suffixIcon: suffixIcon??null,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: borderRadius??BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.cF0F5FA),
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius??BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.cF0F5FA),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: borderRadius??BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.cF0F5FA),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius??BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.cF0F5FA),)

          ,),);
  }
}