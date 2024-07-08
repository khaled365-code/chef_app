





import 'dart:io';

import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/features/auth/presentation/viewmodels/cubits/signup_cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/widgets/custom_image_picker.dart';
import '../../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_unoutlined_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../data/repos/user_repository_implementation.dart';

class SignupScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context)
  {


    return BlocProvider(
    create: (context) => SignupCubit(user: UserRepoImplementation(api: DioConsumer(dio: Dio()))),
      child: SafeArea(
      child: Scaffold(

          body: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state)
            {
              if (state is SignupSuccessState)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.successMessage)));
                  navigate(context: context, route: Routes.homeScreen);

                }
              else if (state is SignupFailureState)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }

            },
          builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: BlocProvider.of<SignupCubit>(context).signuUpKey,
              child: Column(
                children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        children: [
                          Image.asset(
                            imageConstants.rectangle,
                            width: double.infinity,
                            height: 190,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child:  BlocProvider.of<SignupCubit>(context).profilePic==null?
                                    CustomImagePickerAvatar(
                                      galleryOnTap: ()
                                      {
                                        imagePick(imageSource: ImageSource.gallery).then((value) => BlocProvider
                                            .of<SignupCubit>(
                                            context)
                                            .updateProfileImage(
                                            value!));

                                      },
                                      cameraOnTap: ()
                                      {
                                        imagePick(imageSource: ImageSource.camera).then((value) => BlocProvider
                                            .of<SignupCubit>(
                                            context)
                                            .updateProfileImage(
                                            value!));

                                      },
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(File(
                                          BlocProvider.of<SignupCubit>(context)
                                            .profilePic
                                              !.path)),
                                      radius: 40,
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 130),
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 62),
                      child: Column(
                        children: [
                          UnoutlinedTextField(
                            controller: BlocProvider.of<SignupCubit>(context)
                                .name,
                            labelText: S.of(context).name,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).please_enter_name;
                              }
                              return null;
                            },
                          ),
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
                          ),
                          UnoutlinedTextField(
                            controller: BlocProvider.of<SignupCubit>(context)
                                .confirmPassword,
                            textInputType: TextInputType.visiblePassword,
                            labelText: S.of(context).confirmPassword,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return S
                                    .of(context)
                                    .please_enter_valid_password;
                              }
                              else if(value!=BlocProvider.of<SignupCubit>(context).passwordController.text)
                                {
                                  return S.of(context).confirmPasswordError;
                                }
                              return null;
                            },
                            suffixIcon:
                            BlocProvider.of<SignupCubit>(context).confirmIcon,
                            suffixIconOnPressed: () {
                              BlocProvider.of<SignupCubit>(context)
                                  .changeConfirmSignUpEye();
                            },
                            obsecureText: BlocProvider.of<SignupCubit>(context)
                                .confirmPasswordHiddden,
                          ),
                          UnoutlinedTextField(
                            controller: BlocProvider.of<SignupCubit>(context)
                                .phoneNumber,
                            labelText: S.of(context).phone_number,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty ) {
                                return S.of(context).please_enter_phone;
                              }
                              return null;
                            },
                          ),
                          UnoutlinedTextField(
                            controller: BlocProvider.of<SignupCubit>(context)
                                .prand,
                            labelText: S.of(context).brandname,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty )
                              {
                                return S.of(context).pleaseEnterBrandName;
                              }
                              return null;
                            },
                          ),
                          UnoutlinedTextField(
                            controller: BlocProvider.of<SignupCubit>(context)
                                .disc,
                            labelText: S.of(context).disc,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).please_enter_desc;
                              }
                              else if(value.length <20)
                                {
                                  return S.of(context).pleaseDiscLength;

                                }
                              return null;
                            },
                          ),







                        ],
                      ),
                    ),
                    SizedBox(
                    height: 20,
                  ),
                    state is SignupLoadingState? Center(child: CustomProgressIndicator()) :
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SharedButton(
                        text: S.of(context).register,
                        width: 260,
                        height: 50,
                        textStyle:
                            AppTextStyles.font14.copyWith(color: AppColors.white),
                        borderRadius: BorderRadius.circular(30),
                        buttonColor: AppColors.primary,
                        onPressed: () {
                          if (BlocProvider.of<SignupCubit>(context)
                              .signuUpKey
                              .currentState!
                              .validate() && BlocProvider.of<SignupCubit>(context).profilePic!=null)
                          {

                            BlocProvider.of<SignupCubit>(context).signUp();

                          }
                        },
                      ),
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


