



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/utilis/commons.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_unoutlined_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';

class SignupScreen extends StatelessWidget {

  static final signUpKey=GlobalKey<FormState>();
  late final signUpEmail;
  late final signUpPassword;
  @override
  Widget build(BuildContext context)
  {

    return SafeArea(
      child: Scaffold(

          body: SingleChildScrollView(
            child: Form(
              key: signUpKey,
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
                                  navigate(context: context, route: Routes.loginScreen);

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
                    padding:const EdgeInsets.symmetric(horizontal: 62),
                    child: Column(
                      children: [
                        UnoutlinedTextField(
                          //controller: emailController,
                          labelText: S.of(context).emailaddress,
                          textInputType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            signUpEmail = value;
                          },
                        ),
                        UnoutlinedTextField(
                          //controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          labelText: S.of(context).password,
                          obsecureText: true,
                          onFieldSubmitted: (value) {
                            signUpPassword = value;
                          },
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
                      if (signUpKey.currentState!.validate()) {
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
