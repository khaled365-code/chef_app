


import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/change_password_cubit/change_password_cubit.dart';

class ChangeOldPasswordField extends StatelessWidget {
  const ChangeOldPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Old password',
        childWidget: CustomOutlineTextField(
            keyboardType: TextInputType.text,
            obscureText: ChangePasswordCubit.get(context).oldPasswordObscure,
            suffixIcon: GestureDetector(
                onTap: ()
                {
                  ChangePasswordCubit.get(context).changeOldPasswordIconShape();
                },
                child: Icon(ChangePasswordCubit.get(context).oldPasswordIcon,color: AppColors.cB4B9CA)),
            onFieldSubmitted: (value)
            {
              onSubmittedAction(context);
            },
            validator: (value)
            {
              if(value!.isEmpty)
              {
                return 'please enter your old password';
              }
              else
              {
                return null;
              }
            },
            controller: ChangePasswordCubit.get(context).oldPasswordController));
  }

  void onSubmittedAction(BuildContext context) {
     if(ChangePasswordCubit.get(context).changePasswordFormKey.currentState!.validate())
    {
      ChangePasswordCubit.get(context).changePasswordFormKey.currentState!.save();
      ChangePasswordCubit.get(context).changePasswordFun(
          oldPassword: ChangePasswordCubit.get(context).oldPasswordController.text,
          newPassword: ChangePasswordCubit.get(context).newPasswordController.text,
          confirmPassword: ChangePasswordCubit.get(context).confirmPasswordController.text);
    }
    else
    {
      ChangePasswordCubit.get(context).activateChangePasswordAutoValidateMode();
    }
  }
}
