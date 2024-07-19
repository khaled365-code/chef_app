

import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/custom_outline_text_field.dart';
import '../widgets/name_and_text_field_widget.dart';
import '../widgets/otp_code_container.dart';

class ForgetPassSendCodeScreen extends StatelessWidget {
  const ForgetPassSendCodeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    String emailText=ModalRoute.of(context)!.settings.arguments as String;
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
  listener: (context, state)
  {
    if(state is ForgetPassChangeWithCodeFailureState)
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
    if(state is ForgetPassChangeWithCodeSuccessState)
      {
        buildScaffoldMessenger(context: context, msg: state.message);
        navigate(context: context, route: Routes.loginScreen);
      }
  },
  builder: (context, state) {
    var forgetPassCubit=BlocProvider.of<ForgetPassCubit>(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              AuthHeaderWidget(
                  title: 'Verification',
                  subTitle: 'We have sent a code to your email\n$emailText',
                 hasBackButton: true,
                incomingContext: context,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Form(
                  key: forgetPassCubit.verifyCodeFormKey,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height*530/812,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        topLeft: Radius.circular(25.r),
                      ),
                  ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                        child: Column(
                          children:
                          [
                            SpaceWidget(height: 24.h,),
                            NameAndTextFieldWidget(
                                title: 'New Password',
                                childWidget: CustomOutlineTextField(
                                  obscureText: forgetPassCubit.newPasswordObscure,
                                  suffixIcon: GestureDetector(
                                    onTap: ()
                                      {
                                        forgetPassCubit.changeNewPasswordShape();
                                      },
                                      child: Icon(forgetPassCubit.newPasswordIcon,color: AppColors.cB4B9CA,)),
                                  controller: forgetPassCubit.newPasswordController,
                                  hintText: 'example@gmail.com',
                                  hintStyle: AppTextStyles.regular13(
                                      context).copyWith(
                                      color: AppColors.c32343E),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value)
                                  {
                                    if(forgetPassCubit.verifyCodeFormKey.currentState!.validate())
                                    {
                                      forgetPassCubit.forgetPassChangeWithCodeFun(
                                          email: forgetPassCubit.emailForForgetPassController.text,
                                          code: getCompleteEmail(forgetPassCubit: forgetPassCubit),
                                          password: forgetPassCubit.newPasswordController.text,
                                          confirmPassword: forgetPassCubit.confirmNewPasswordController.text);
                                    }
                                  },
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

                                )),
                            SpaceWidget(height: 24.h,),
                            NameAndTextFieldWidget(
                                title: 'Confirm Password',
                                childWidget: CustomOutlineTextField(
                                  suffixIcon: GestureDetector(
                                      onTap: ()
                                      {
                                        forgetPassCubit.changeConfirmNewPasswordShape();
                                      },
                                      child: Icon(forgetPassCubit.confirmNewPasswordIcon,color: AppColors.cB4B9CA,)),
                                  obscureText: forgetPassCubit.confirmNewPasswordObscure,
                                  controller: forgetPassCubit.confirmNewPasswordController,
                                  hintText: 'example@gmail.com',
                                  hintStyle: AppTextStyles.regular13(
                                      context).copyWith(
                                      color: AppColors.c32343E),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value)
                                  {
                                    if(forgetPassCubit.verifyCodeFormKey.currentState!.validate())
                                    {
                                      forgetPassCubit.forgetPassChangeWithCodeFun(
                                          email: forgetPassCubit.emailForForgetPassController.text,
                                          code: getCompleteEmail(forgetPassCubit: forgetPassCubit),
                                          password: forgetPassCubit.newPasswordController.text,
                                          confirmPassword: forgetPassCubit.confirmNewPasswordController.text);
                                    }
                                  },
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                      {
                                        return 'You must confirm your password';
                                      }
                                    if(forgetPassCubit.confirmNewPasswordController.text!=forgetPassCubit.newPasswordController.text)
                                      {
                                        return 'passwords do not match';
                                      }
                                    else
                                      {
                                        return null;
                                      }
                                  },

                                )),
                            SpaceWidget(height: 24.h,),
                            NameAndTextFieldWidget(
                                title: 'Code',
                                childWidget: Row(
                                  children: List.generate(
                                      6,
                                      (index) => Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(end:  index!=5? 10.w:0),
                                          child: OtpCodeContainer(
                                            singleContainerController: getCodeController(index: index,forgetPassCubit: forgetPassCubit),
                                          ),
                                        ),
                                      ),),
                                )),
                            SpaceWidget(height: 30,),

                            state is ForgetPassChangeWithCodeLoadingState?
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
                              btnText: 'Verify',
                              onPressessed: ()
                              {
                                  if(forgetPassCubit.verifyCodeFormKey.currentState!.validate())
                                    {
                                      forgetPassCubit.forgetPassChangeWithCodeFun(
                                          email: emailText,
                                          code: getCompleteEmail(forgetPassCubit: forgetPassCubit),
                                          password: forgetPassCubit.newPasswordController.text,
                                          confirmPassword: forgetPassCubit.confirmNewPasswordController.text);
                                    }
                              },
                            )

                          ],
                        ),
                      ),
                    ),
                ),
              )

          )]),

    ));
  },
);
  }
  TextEditingController getCodeController({required int index,required ForgetPassCubit forgetPassCubit})
  {
    switch (index)
    {
      case 0:
        return forgetPassCubit.firstCodeController;
      case 1:
        return forgetPassCubit.secondCodeController;
      case 2:
        return forgetPassCubit.thirdCodeController;
      case 3:
        return forgetPassCubit.fourthCodeController;
      case 4:
        return forgetPassCubit.fifthCodeController;
      case 5:
        return forgetPassCubit.sixthCodeController;
      default:
        return forgetPassCubit.firstCodeController;
    }
  }
  String getCompleteEmail({required ForgetPassCubit forgetPassCubit})
  {
    return forgetPassCubit.firstCodeController.text+
        forgetPassCubit.secondCodeController.text+
        forgetPassCubit.thirdCodeController.text+
        forgetPassCubit.fourthCodeController.text+
        forgetPassCubit.fifthCodeController.text+
        forgetPassCubit.sixthCodeController.text;
  }
}
