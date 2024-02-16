



import 'package:chef_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/utilis/commons.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_unoutlined_text_field.dart';
import '../../../../generated/l10n.dart';

class SignupScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
  create: (context) => SignupCubit(),
  child: SafeArea(
      child: Scaffold(

          body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: BlocProvider.of<SignupCubit>(context).signuUpKey,
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
                                  onPressed: () {},
                                  child: Text(
                                    S.of(context).signup,
                                    style: AppTextStyles.font16
                                        .copyWith(color: AppColors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    navigate(
                                        context: context,
                                        route: Routes.loginScreen);
                                  },
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
                            controller: BlocProvider.of<SignupCubit>(context)
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
                            controller: BlocProvider.of<SignupCubit>(context)
                                .passwordController,
                            textInputType: TextInputType.visiblePassword,
                            labelText: S.of(context).password,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return S
                                    .of(context)
                                    .please_enter_valid_password;
                              }
                              return null;
                            },
                            suffixIcon:
                                BlocProvider.of<SignupCubit>(context).icon,
                            suffixIconOnPressed: () {
                              BlocProvider.of<SignupCubit>(context)
                                  .changeSignUpEye();
                            },
                            obsecureText: BlocProvider.of<SignupCubit>(context)
                                .passwordHiddden,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                    height: 50,
                  ),
                    SharedButton(
                      text: S.of(context).register,
                      width: 280,
                      height: 60,
                      textStyle:
                          AppTextStyles.font14.copyWith(color: AppColors.white),
                      borderRadius: BorderRadius.circular(30),
                      buttonColor: AppColors.primary,
                      onPressed: () {
                        if (BlocProvider.of<SignupCubit>(context)
                            .signuUpKey
                            .currentState!
                            .validate()) {
                          navigate(
                              context: context, route: Routes.profileScreen);
                          //emailController.clear();
                          //passwordController.clear();
                        }
                      },
                    )
                  ],
              ),
            ),
          );
  },
)
      ),
    ),
);

  }
}
