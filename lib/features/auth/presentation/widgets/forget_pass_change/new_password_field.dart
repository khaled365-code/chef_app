


import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/forget_pass_cubit/forget_pass_cubit.dart';

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New Password',
        childWidget: CustomOutlineTextField(
          obscureText: ForgetPassCubit.get(context).newPasswordObscure,
          suffixIcon: GestureDetector(
              onTap: ()
              {
                ForgetPassCubit.get(context).changeNewPasswordShape();
              },
              child: Icon(ForgetPassCubit.get(context).newPasswordIcon,color: AppColors.cB4B9CA,)),
          controller: ForgetPassCubit.get(context).newPasswordController,
          hintText: 'example@gmail.com',
          hintStyle: AppTextStyles.regular14(context).copyWith(
              color: AppColors.c32343E),
          keyboardType: TextInputType.text,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'You must enter your password';
            }
            else
            {
              return null;
            }
          },

        ));
  }
}