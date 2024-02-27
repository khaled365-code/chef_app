





import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/widgets/custom_progress_indicator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/database/api/dio_consumer.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/outlined_text_field.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repos/user_repository_implementation.dart';
import '../../viewmodels/cubits/send_code_cubit/send_code_cubit.dart';

class SendCodeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SendCodeCubit(userRepo:UserRepoImplementation(api: DioConsumer(dio: Dio()))),
  child: BlocConsumer<SendCodeCubit, SendCodeState>(
  listener: (context, state)
    {
      if(state is SendCodeSuccess)
      {
        showToast(msg: state.successMessage,toastStates: ToastStates.success);
        navigate(context: context, route: Routes.resetPasswordScreen,arg: BlocProvider.of<SendCodeCubit>(context).emailController.text);
      }
      else if(state is SendCodeFailure)
      {
        showToast(msg: state.errorMessage,toastStates: ToastStates.success);
      }

  },
  builder: (context, state) {
    return SafeArea(
      child: Form(
        key: BlocProvider.of<SendCodeCubit>(context).sendCodeKey,
        child: Scaffold(
          body:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 39,),
                Center(child: Text(S.of(context).forgotpasscode,style: AppTextStyles.font32.copyWith(color: AppColors.black,fontWeight: FontWeight.bold),)),
                SizedBox(
                  height: 5,
                ),
                Image.asset(AppAssets.forgotpass),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    children: [
                      Text(S.of(context).sendResetemail,style: AppTextStyles.font16.copyWith(color: AppColors.black)),
                      Text(S.of(context).sendResetcode,style: AppTextStyles.font16.copyWith(color: AppColors.black)),
                      SizedBox(height: 20,),
                      OutlinedTextField(
                        top: 20,
                        controller: BlocProvider.of<SendCodeCubit>(context).emailController,
                        fillColor: AppColors.grey2,
                        hintText: S.of(context).email,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@gmail.com')) {
                            return S.of(context).please_enter_email;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25,),
                      state is SendCodeLoading? Center(child: CustomProgressIndicator(),) :SharedButton(
                          text: S.of(context).sendcode,
                          width: 328,
                          height: 57,
                          textStyle: AppTextStyles.font24,
                          buttonColor: AppColors.primary,
                          borderRadius: BorderRadius.circular(25),
                          onPressed: ()
                        {
                          if(BlocProvider.of<SendCodeCubit>(context).sendCodeKey.currentState!.validate())
                            {
                              BlocProvider.of<SendCodeCubit>(context).sendCode();

                            }
                        },
                      ),
                    ],
                  ),
                )


              ],
            ),
          )
        ),

        ),
      );
  },
),
    
);
  }
}