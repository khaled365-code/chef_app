import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:chef_app/features/profile/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/injection/injector.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../core/widgets/name_and_text_field_widget.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePasswordCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),
      child: BlocConsumer<ChangePasswordCubit,ChangePasswordState>(
        listener: (context, state) {
          var changePasswordCubit = BlocProvider.of<ChangePasswordCubit>(context);
          if(state is ChangePasswordSuccessState)
            {
              changePasswordCubit.oldPasswordController.clear();
              changePasswordCubit.newPasswordController.clear();
              changePasswordCubit.confirmPasswordController.clear();
              showToast(msg: 'password updated successfully', toastStates: ToastStates.success);
              Navigator.pop(context);
            }
          if(state is ChangePasswordFailureState)
            {
              if(state.errorModel.error!=null)
              {
                showToast(msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1), toastStates: ToastStates.error);

              }
              else
              {
                showToast(msg: state.errorModel.errorMessage!, toastStates: ToastStates.error);
              }
            }
        },
        builder: (context, state) {
          var changePasswordCubit = BlocProvider.of<ChangePasswordCubit>(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Form(
                  key: changePasswordCubit.changePasswordFormKey,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceWidget(height: 15,),
                          Container(
                            height: 50.h,
                            padding: EdgeInsetsDirectional.only(start: 15.w),
                            decoration: BoxDecoration(
                              color: AppColors.cFAFAFA,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'Change Password ', style: AppTextStyles.bold18(
                                  context).copyWith(color: AppColors.c181C2E),),
                            ),
                          ),
                          state is ChangePasswordLoadingState?
                          Column(
                            children: [
                              SpaceWidget(height: 20,),
                              Center(child: Lottie.asset(ImageConstants.loadingLottie)),
                              SpaceWidget(height: 20,),

                            ],
                          ):
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        color: AppColors.cEBEBEB,
                                        width: 2.w
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Column(
                                    children: [
                                      SpaceWidget(height: 20,),
                                      NameAndTextFieldWidget(
                                          title: 'Old password',
                                          childWidget: CustomOutlineTextField(
                                              keyboardType: TextInputType.text,
                                              obscureText: changePasswordCubit.oldPasswordObscure,
                                              suffixIcon: GestureDetector(
                                                  onTap: ()
                                                  {
                                                    changePasswordCubit.changeOldPasswordIconShape();
                                                  },
                                                  child: Icon(changePasswordCubit.oldPasswordIcon,color: AppColors.cB4B9CA)),
                                              onFieldSubmitted: (value) {
                                                if(changePasswordCubit.changePasswordFormKey.currentState!.validate())
                                                {
                                                  changePasswordCubit.changePasswordFun(
                                                      oldPassword: changePasswordCubit.oldPasswordController.text,
                                                      newPassword: changePasswordCubit.newPasswordController.text,
                                                      confirmPassword: changePasswordCubit.confirmPasswordController.text);
                                                }
                                              },
                                              validator: (value) {
                                               if(value!.isEmpty)
                                                 {
                                                   return 'please enter your old password';
                                                 }
                                               else
                                                 {
                                                   return null;
                                                 }
                                              },
                                              controller: changePasswordCubit.oldPasswordController)),
                                      SpaceWidget(height: 14,),
                                      NameAndTextFieldWidget(
                                          title: 'New password',
                                          childWidget: CustomOutlineTextField(
                                              keyboardType: TextInputType.text,
                                              obscureText: changePasswordCubit.newPasswordObscure,
                                              suffixIcon: GestureDetector(
                                                  onTap: ()
                                                  {
                                                    changePasswordCubit.changeNewPasswordIconShape();
                                                  },
                                                  child: Icon(changePasswordCubit.newPasswordIcon,color: AppColors.cB4B9CA)),
                                              onFieldSubmitted: (value) {
                                                if(changePasswordCubit.changePasswordFormKey.currentState!.validate())
                                                {
                                                  changePasswordCubit.changePasswordFun(
                                                      oldPassword: changePasswordCubit.oldPasswordController.text,
                                                      newPassword: changePasswordCubit.newPasswordController.text,
                                                      confirmPassword: changePasswordCubit.confirmPasswordController.text);
                                                }
                                              },
                                              validator: (value) {
                                                if(value!.isEmpty)
                                                {
                                                  return 'please enter your new password';
                                                }
                                                if(value.length<6)
                                                {
                                                  return 'password must be at least 6 characters long';
                                                }
                                                else
                                                {
                                                  return null;
                                                }
                                              },
                                              controller: changePasswordCubit.newPasswordController)),
                                      SpaceWidget(height: 14,),
                                      NameAndTextFieldWidget(
                                          title: 'Confirm password',
                                          childWidget: CustomOutlineTextField(
                                              keyboardType: TextInputType.text,
                                              obscureText: changePasswordCubit.confirmPasswordObscure,
                                              suffixIcon: GestureDetector(
                                                onTap: ()
                                                  {
                                                    changePasswordCubit.changeConfirmPasswordIconShape();
                                                  },
                                                  child: Icon(changePasswordCubit.confirmPasswordIcon,color: AppColors.cB4B9CA)),
                                              onFieldSubmitted: (value) {
                                                if(changePasswordCubit.changePasswordFormKey.currentState!.validate())
                                                {
                                                  changePasswordCubit.changePasswordFun(
                                                      oldPassword: changePasswordCubit.oldPasswordController.text,
                                                      newPassword: changePasswordCubit.newPasswordController.text,
                                                      confirmPassword: changePasswordCubit.confirmPasswordController.text);
                                                }
                                              },
                                              validator: (value) {
                                                if(value!.isEmpty)
                                                {
                                                  return 'please confirm your new password';
                                                }
                                                if(value.length<6)
                                                {
                                                  return 'password must be at least 6 characters long';
                                                }
                                                if(value!=changePasswordCubit.newPasswordController.text)
                                                  {
                                                    return 'passwords do not match';
                                                  }
                                                else
                                                {
                                                  return null;
                                                }
                                              },
                                              controller: changePasswordCubit.confirmPasswordController)),
                                      SpaceWidget(height: 10,),
                                      Text(
                                        'Your password must be at least 6 characters long',
                                        style: AppTextStyles.regular14(context).copyWith(
                                            color: AppColors.cA0A5BA
                                        ),),
                                      SpaceWidget(height: 20,),


                                    ],
                                  ),
                                ),
                              ),
                              SpaceWidget(height: 10,),
                              Row(
                                children: [
                                  Spacer(),
                                  Expanded(
                                    flex: 1,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            side: BorderSide(color: AppColors.cD2D2D2),
                                          ),
                                          fixedSize: Size(0, 40.h),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: FittedBox(child: Text('Cancel',
                                          style: AppTextStyles.bold16(context).copyWith(
                                              color: AppColors.c181C2E),))),
                                  ),
                                  SpaceWidget(width: 10,),
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            side: BorderSide(color: AppColors.cD2D2D2),
                                          ),
                                          fixedSize: Size(0, 40.h),
                                        ),
                                        onPressed: () {
                                          if(changePasswordCubit.changePasswordFormKey.currentState!.validate())
                                          {
                                            changePasswordCubit.changePasswordFun(
                                                oldPassword: changePasswordCubit.oldPasswordController.text,
                                                newPassword: changePasswordCubit.newPasswordController.text,
                                                confirmPassword: changePasswordCubit.confirmPasswordController.text);
                                          }
                                        },
                                        child: FittedBox(child: Text('Change Password',
                                          style: AppTextStyles.bold16(context).copyWith(
                                              color: AppColors.white),))),
                                  )

                                ],
                              ),
                              SpaceWidget(height: 20,),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
