

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class UnoutlinedTextField extends StatelessWidget {
  const UnoutlinedTextField({super.key, required this.textInputType,  this.obsecureText, required this.labelText,required this.onFieldSubmitted});

  final TextInputType textInputType;
  final bool? obsecureText;
  final String labelText;
  final Function(String) onFieldSubmitted;
  //final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value)
      {
        if(value!.isEmpty)
          {
            return S.of(context).fieldrequired;
          }
        else
          {
            return null;
          }

      },

      keyboardType: textInputType,
      obscureText: obsecureText??false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.font14.copyWith(color: AppColors.grey),
        enabledBorder: UnderlineInputBorder(),

      ),
    );
  }
}