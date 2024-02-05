


import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/shared_unoutlined_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';

class LoginScreen extends StatelessWidget {

  static final loginFormKey=GlobalKey<FormState>();
  late final  loginEmail;
  late final passwordEmail;
  //final emailController=TextEditingController();
  //final passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
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
                                navigate(context: context, route: Routes.signUpScreen);
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
                      //controller: emailController,
                      labelText: S.of(context).emailaddress,
                      textInputType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        loginEmail = value;
                      },
                    ),
                    UnoutlinedTextField(
                      //controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      labelText: S.of(context).password,
                      obsecureText: true,
                      onFieldSubmitted: (value) {
                        passwordEmail = value;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: 14,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 48,right: isArabic()?40:0),
                  child: Align(
                      alignment: isArabic()? Alignment.centerRight:Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            S.of(context).forgotpasscode,
                            style: AppTextStyles.font16
                                .copyWith(color: AppColors.primary),
                          ))),
                ),
                SizedBox(
                  height: 50,
                ),
                SharedButton(
                  text: S.of(context).login,
                  width: 280,
                  height: 60,
                  textStyle:
                      AppTextStyles.font14.copyWith(color: AppColors.white),
                  borderRadius: BorderRadius.circular(30),
                  buttonColor: AppColors.primary,
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      navigate(context: context, route: Routes.profileScreen);
                      //emailController.clear();
                      //passwordController.clear();
                    }
                  },
                )
              ],
            ),
          ),
        )
      ),
      );
  }
}


