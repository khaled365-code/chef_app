import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/widgets/custom_progress_indicator.dart';
import 'package:chef_app/features/auth/data/repos/user_repository_implementation.dart';
import 'package:chef_app/features/auth/presentation/viewmodels/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/outlined_text_field.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../generated/l10n.dart';

class ResetPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    final String email=ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => ResetPasswordCubit(userRepo: UserRepoImplementation(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context,state)
      {
        if(state is ResetPasswordSuccess)
        {
          showToast(msg: state.successMessage,toastStates: ToastStates.success);
          navigate(context: context, route: Routes.loginScreen);
        }
        else if(state is ResetPasswordFailure)
        {
          showToast(msg: state.errorMessage,toastStates: ToastStates.success);
        }
      },
    builder: (context, state) {
    return SafeArea(
        child: Form(
          key: BlocProvider.of<ResetPasswordCubit>(context).resetPassKey,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Center(child: Text(S.of(context).createYourNewPassword, style: AppTextStyles.font24.copyWith(color: AppColors.black),)),
                    SizedBox(height: 5,),
                    Image.asset(AppAssets.forgotpass),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children:
                        [
                          Center(child: OutlinedTextField(
                            top: 20,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return S.of(context).please_enter_valid_password;
                              }
                              return null;
                            },
                            controller: BlocProvider.of<ResetPasswordCubit>(context).passwordController,
                            hintText: S.of(context).newPassword,
                            textInputType: TextInputType.visiblePassword,
                            obsecureText: BlocProvider.of<ResetPasswordCubit>(context).passwordHidden,
                            fillColor: AppColors.grey2,
                            borderRadiusValue: 25,
                            suffixIcon: BlocProvider.of<ResetPasswordCubit>(context).icon,
                            suffixIconOnPressed: ()
                            {
                              BlocProvider.of<ResetPasswordCubit>(context).changeEyeForm();
                            },
                          )),
                          SizedBox(height: 10,),
                          Center(child: OutlinedTextField(
                            top: 20,
                            validator: (value)
                            {
                              if (value!.isEmpty || value.length < 8) {
                                return S.of(context).please_enter_valid_password;
                              }
                              else if(value!=BlocProvider.of<ResetPasswordCubit>(context).passwordController.text)
                              {
                                return S.of(context).confirmPasswordError;
                              }
                              return null;
                            },
                            controller: BlocProvider.of<ResetPasswordCubit>(context).confirmPasswordController,
                            hintText: S.of(context).confirmPassword,
                            textInputType: TextInputType.visiblePassword,
                            obsecureText: BlocProvider.of<ResetPasswordCubit>(context).confirmPasswordHidden,
                            fillColor: AppColors.grey2,
                            borderRadiusValue: 25,
                            suffixIcon: BlocProvider.of<ResetPasswordCubit>(context).confirmIcon,
                            suffixIconOnPressed: ()
                            {
                              BlocProvider.of<ResetPasswordCubit>(context).changeConfirmEye();
                            },
                          )),
                          SizedBox(height: 10,),
                          Center(child: OutlinedTextField(
                            top: 20,
                            validator: (value)
                            {
                              if(num.tryParse(value!)==null || value.isEmpty)
                                {
                                  return S.of(context).pleaseEnterValidCode;

                                }
                              return null;
                            },
                            controller: BlocProvider.of<ResetPasswordCubit>(context).codeController,
                            hintText: S.of(context).code,
                            textInputType: TextInputType.visiblePassword,
                            obsecureText: false,
                            fillColor: AppColors.grey2,
                            borderRadiusValue: 25,
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: state is ResetPasswordLoading ? Center(child: CustomProgressIndicator(),)
                          : SharedButton(
                        text: S.of(context).verify,
                        width: 340,
                        height: 56,
                        borderRadius: BorderRadius.circular(25),
                        textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                        buttonColor: AppColors.primary,
                        onPressed: ()
                        {
                          if( BlocProvider.of<ResetPasswordCubit>(context).resetPassKey.currentState!.validate())
                          {
                            BlocProvider.of<ResetPasswordCubit>(context).email=email;
                            BlocProvider.of<ResetPasswordCubit>(context).resetPassword();

                          }

                        },
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
        ),
      );
  },
),
    );
  }
}