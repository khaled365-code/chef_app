


import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/widgets/custom_progress_indicator.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/viewmodels/change_password_cubit/change_password_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/outlined_text_field.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../generated/l10n.dart';

class ChangePasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ChangePasswordCubit(homeRepoImplementation: HomeRepoImplementation(api: DioConsumer(dio: Dio()))),
  child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
  listener: (context, state)
  {
    if (state is ChangePasswordSuccess)
      {
        showToast(msg: 'Password Changed Successfully', toastStates: ToastStates.success);
      }
    if (state is ChangePasswordFailure)
    {
      showToast(msg: state.errorMessage, toastStates: ToastStates.error);
    }
  },
  builder: (context, state) {
    final changePassCubit=BlocProvider.of<ChangePasswordCubit>(context);
    return Form(
      key: changePassCubit.changePassKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.grey2,
          body: SingleChildScrollView(
            child: Column(
              children:
              [
               Container(
                 height: 180,
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 37,left: 17),
                       child: IconButton(onPressed: (){
                         Navigator.pop(context);
                       } ,icon:Icon(Icons.arrow_back_ios_outlined)),
                     ),
                     Spacer(),
                     Align(
                       alignment: Alignment.topRight,
                         child: Image.asset(imageConstants.pizzachangepass)),
                   ],
                 ),
               ),
                Container(
                  width: 350,
                  height: 430,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(child: Text(S.of(context).forgetpassword,style: AppTextStyles.font24.copyWith(color: AppColors.black))),
                      ),
                      SizedBox(height: 28,),
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Please enter your old and new passsword',style: AppTextStyles.font12.copyWith(color: AppColors.grey)),
                            Text('And your password will be updated',style: AppTextStyles.font12.copyWith(color: AppColors.grey)),
                
                          ],
                        ),
                      ),
                      SizedBox(height: 23,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).changePassword,style: AppTextStyles.font14.copyWith(color: AppColors.black,)),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                    width: 2
                
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.only(
                                  top: 20,
                                    start: 10
                
                                ),
                                hintText: S.of(context).oldPassword,
                                  suffixIcon: IconButton(onPressed: (){
                                    changePassCubit.changePasswordEye();
                                  }, icon: Icon(changePassCubit.suffixIcon)),


                
                              ),
                              obscureText: changePassCubit.securePassword,
                              controller: changePassCubit.oldPassController,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                  {
                                    return S.of(context).please_enter_valid_password;
                                  }
                                return null;
                              },
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primary,
                                      width: 2
                
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.only(
                                  top: 20,
                                    start: 10
                
                
                                ),
                                  hintText: S.of(context).newPassword,
                                suffixIcon: IconButton(onPressed: (){
                                  changePassCubit.changePasswordEye2();
                                }, icon: Icon(changePassCubit.suffixIcon2)),
                
                
                              ),
                              obscureText: changePassCubit.securePassword2,

                              controller: changePassCubit.newPassController,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return S.of(context).please_enter_valid_password;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primary,
                                      width: 2
                
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.only(
                                  top: 20,
                                  start: 10
                                ),
                                  hintText: S.of(context).confirmPassword,
                                suffixIcon: IconButton(onPressed: (){
                                  changePassCubit.changePasswordEye3();
                                }, icon: Icon(changePassCubit.suffixIcon3)),
                
                
                
                              ),
                              obscureText: changePassCubit.securePassword3,
                              controller: changePassCubit.confirmPassController,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return S.of(context).please_enter_valid_password;
                                }
                                else if(value!=changePassCubit.newPassController.text)
                                  {
                                    return S.of(context).confirmPasswordError;
                                  }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Center(
                          child: state is ChangePasswordLoading ? CustomProgressIndicator()
                              : state is ChangePasswordFailure ? SharedButton(
                              text: S.of(context).changePassword,
                              width: 288,
                              height: 45,
                              textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                              buttonColor: AppColors.primary,
                              onPressed: ()
                            {
                              if(changePassCubit.changePassKey.currentState!.validate())
                                {
                                  changePassCubit.changePassword();
                                }
                            },
                          )
                              : SharedButton(
                              text: S.of(context).changePassword,
                              width: 288,
                              height: 45,
                              textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                              buttonColor: AppColors.primary,
                            onPressed: ()
                            {
                              if(changePassCubit.changePassKey.currentState!.validate())
                              {
                                changePassCubit.changePassword();
                              }
                            },
                          ),
                        ),
                      ),
                
                
                
                
                
                
                    ],
                
                  ),
                
                
                )
              ],
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