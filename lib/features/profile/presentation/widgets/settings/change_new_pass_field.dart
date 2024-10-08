

import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/services/internet_connection_service.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../cubits/change_password_cubit/change_password_cubit.dart';

class ChangeNewPasswordField extends StatelessWidget {
  const ChangeNewPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New password',
        childWidget: CustomOutlineTextField(
            maxLines: 1,
            keyboardType: TextInputType.text,
            obscureText: ChangePasswordCubit.get(context).newPasswordObscure,
            suffixIcon: GestureDetector(
                onTap: ()
                {
                  ChangePasswordCubit.get(context).changeNewPasswordIconShape();
                },
                child: Icon(ChangePasswordCubit.get(context).newPasswordIcon,color: AppColors.cB4B9CA)),
            onFieldSubmitted: (value)
            {
              onSubmittedAction(context);
            },
            validator: (value)
            {
              if(value!.isEmpty)
              {
                return 'please enter your new password';
              }
              if(value.length<6)
              {
                return 'password must be at least 6 characters long';
              }
              if(value!= ChangePasswordCubit.get(context).confirmPasswordController.text)
                {
                  return 'passwords do not match';
                }
              else
              {
                return null;
              }
            },
            controller: ChangePasswordCubit.get(context).newPasswordController));
  }

  void onSubmittedAction(BuildContext context) async
  {
    if( await InternetConnectionCheckingService.checkInternetConnection()==true)
    {
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
    else
    {
    showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
    }
  }
}
