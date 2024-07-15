import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_outline_text_field.dart';
import 'package:chef_app/features/auth/presentation/widgets/name_and_text_field_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../widgets/auth_header.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPassCubit = BlocProvider.of<ForgetPassCubit>(context);
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
  listener: (context, state)
  {
    if (state is ForgetPassSendCodeSuccessState)
      {
        buildScaffoldMessenger(context: context, msg: state.message);

        navigate(context: context, route: Routes.forgetPassSendCodeScreen,arg: forgetPassCubit.emailForForgetPassController.text);
      }
    if(state is ForgetPassSendCodeFailureState)
      {
        if(state.errorModel.error!=null)
        {
          buildScaffoldMessenger(context: context, msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1));
        }
        else
        {

          buildScaffoldMessenger(context: context, msg: state.errorModel.errorMessage!);
        }
      }
  },
  builder: (context, state) {
    return BlocBuilder<ForgetPassCubit, ForgetPassState>(
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
                child: Stack(
                  clipBehavior: Clip.none,
                  children:
                  [
                    AuthHeaderWidget(
                      incomingContext: context,
                      hasBackButton: true,
                      title: 'Forgot Password',
                      subTitle: 'Please sign in to your existing account',
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Form(
                        key: forgetPassCubit.sendEmailFormKey,
                        child: Container(
                          width: MediaQuery
                              .sizeOf(context)
                              .width,
                          height: MediaQuery
                              .sizeOf(context)
                              .height * 550 / 812,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.r),
                              topLeft: Radius.circular(25.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 24.w,
                                end: 24.w),
                            child: Column(
                              children: [
                                SpaceWidget(height: 24.h,),
                                NameAndTextFieldWidget(
                                    title: 'Email',
                                    childWidget: CustomOutlineTextField(
                                      controller: forgetPassCubit.emailForForgetPassController,
                                      hintText: 'example@gmail.com',
                                      hintStyle: AppTextStyles.regular14(
                                          context).copyWith(
                                          color: AppColors.c32343E),
                                      keyboardType: TextInputType.emailAddress,
                                      onFieldSubmitted: (value)
                                      {
                                        if(forgetPassCubit.sendEmailFormKey.currentState!.validate())
                                        {
                                           forgetPassCubit.forgetPassSendCodeFun(email: forgetPassCubit.emailForForgetPassController.text);
                                        }
                                      },
                                      validator: (value)
                                      {
                                        if (value!.isEmpty)
                                        {
                                          return 'You must enter your email';
                                        }
                                        if(EmailValidator.validate(value)==false)
                                        {
                                          return 'invalid email address';
                                        }
                                        else
                                        {
                                          return null;
                                        }

                                      },

                                    )),
                                SpaceWidget(height: 30,),
                                state is ForgetPassSendCodeLoadingState?
                                Center(
                                  child: SizedBox(
                                      width: 30.w,
                                      height: 30.w,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                        strokeWidth: 2.w,
                                      )),
                                ):
                                SharedButton(
                                  btnText: 'Send Code',
                                  onPressessed: ()
                                  {
                                    if(forgetPassCubit.sendEmailFormKey.currentState!.validate())
                                    {
                                       forgetPassCubit.forgetPassSendCodeFun(email: forgetPassCubit.emailForForgetPassController.text);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )


                  ],
                ))

        );
      },
    );
  },
);
  }
}
