

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class UnoutlinedTextField extends StatelessWidget {
  const UnoutlinedTextField({super.key, required this.textInputType,  this.obsecureText=false, required this.labelText, required this.controller, this.suffixIcon, this.suffixIconOnPressed, required this.validator});

  final TextInputType textInputType;
  final bool? obsecureText;
  final String labelText;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      
      keyboardType: textInputType,
      obscureText: obsecureText??false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.font14.copyWith(color: AppColors.grey),
        enabledBorder: UnderlineInputBorder(),
        suffixIcon: IconButton(onPressed: suffixIconOnPressed,icon:Icon(suffixIcon)),


      ),
    );
  }
}