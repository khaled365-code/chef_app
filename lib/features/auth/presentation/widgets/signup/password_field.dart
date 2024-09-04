


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Password',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          obscureText: SignupCubit.get(context).passwordSecureText,
          suffixIcon: GestureDetector(
            onTap: () {
              SignupCubit.get(context).changePasswordIconShape();
            },
            child: Icon(
              SignupCubit.get(context).passwordSuffixIcon,color: AppColors.cB4B9CA,),
          ),
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'You must enter your password';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).passwordController,
          hintText: '* * * * * * * * * *',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
