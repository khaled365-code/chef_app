


import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/forget_pass_cubit/forget_pass_cubit.dart';

class ConfirmPassField extends StatelessWidget {
  const ConfirmPassField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Confirm Password',
        childWidget: CustomOutlineTextField(
          suffixIcon: GestureDetector(
              onTap: ()
              {
                ForgetPassCubit.get(context).changeConfirmNewPasswordShape();
              },
              child: Icon(ForgetPassCubit.get(context).confirmNewPasswordIcon,color: AppColors.cB4B9CA,)),
          obscureText: ForgetPassCubit.get(context).confirmNewPasswordObscure,
          controller: ForgetPassCubit.get(context).confirmNewPasswordController,
          hintText: 'example@gmail.com',
          hintStyle: AppTextStyles.regular14(context).copyWith(
              color: AppColors.c32343E),
          keyboardType: TextInputType.text,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'You must confirm your password';
            }
            if(ForgetPassCubit.get(context).confirmNewPasswordController.text!=ForgetPassCubit.get(context).newPasswordController.text)
            {
              return 'passwords doesn\'t not match';
            }
            else
            {
              return null;
            }
          },

        ));
  }
}