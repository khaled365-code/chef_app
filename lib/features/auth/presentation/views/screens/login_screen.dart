





import 'package:chef_app/features/auth/presentation/viewmodels/cubits/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/database/api/dio_consumer.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_unoutlined_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../../data/repos/user_repository_implementation.dart';

class LoginScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(user: UserRepoImplementation(api: DioConsumer(dio: Dio()))),
  child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState)
                {
                  showToast(msg: 'Login Successfully',toastStates: ToastStates.success);
                  navigate(context: context, route: Routes.homeScreen);
                }
              else if (state is LoginFailureState)
                {
                  showToast(msg: 'Login failled',toastStates: ToastStates.error);

                }
            },
          builder: (context, state) {
          return Form(
            key: BlocProvider.of<LoginCubit>(context).loginForm,
            child: Column(
              children: [
                Stack(
                      children: [
                        Image.asset(
                          AppAssets.rectangle,
                          width: double.infinity,
                          height: 340,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Center(
                              child: Image.asset(
                            AppAssets.hat,
                            width: 120,
                            height: 130,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 270),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    navigate(
                                        context: context,
                                        route: Routes.signUpScreen);
                                  },
                                  child: Text(
                                    S.of(context).signup,
                                    style: AppTextStyles.font16
                                        .copyWith(color: AppColors.black),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    S.of(context).login,
                                    style: AppTextStyles.font16
                                        .copyWith(color: AppColors.black),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                SizedBox(
                      height: 5,
                    ),
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 62),
                      child: Column(
                        children: [
                          UnoutlinedTextField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            labelText: S.of(context).emailaddress,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains('@gmail.com')) {
                                return S.of(context).please_enter_email;
                              }
                              return null;
                            },
                          ),
                          UnoutlinedTextField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            textInputType: TextInputType.visiblePassword,
                            labelText: S.of(context).password,
                            obsecureText: BlocProvider.of<LoginCubit>(context)
                                .passwordHide,
                            suffixIcon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return S
                                    .of(context)
                                    .please_enter_valid_password;
                              }
                              return null;
                            },
                            suffixIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changePasswordEye();
                            },
                          )
                        ],
                      ),
                    ),
                SizedBox(
                      height: 14,
                    ),
                Padding(
                      padding:
                          EdgeInsets.only(left: 48, right: isArabic() ? 40 : 0),
                      child: Align(
                          alignment: isArabic()
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {
                                navigate(context: context, route: Routes.sendCodeScreen);
                              },
                              child: Text(
                                S.of(context).forgotpasscode,
                                style: AppTextStyles.font16
                                    .copyWith(color: AppColors.primary),
                              ))),
                    ),
                SizedBox(
                      height: 50,
                    ),
                state is LoginLoadingState ?Center(child: CustomProgressIndicator()) : SharedButton(
                  text: S.of(context).login,
                  width: 280,
                  height: 60,
                  textStyle:
                  AppTextStyles.font14.copyWith(color: AppColors.white),
                  borderRadius: BorderRadius.circular(30),
                  buttonColor: AppColors.primary,
                  onPressed: () {
                    if (BlocProvider.of<LoginCubit>(context)
                        .loginForm
                        .currentState!
                        .validate())
                    {
                      BlocProvider.of<LoginCubit>(context).signin();


                    }
                  },
                ),

              ],
            ),
          );
  },
),
        )
      ),
      ),
);
  }
}




