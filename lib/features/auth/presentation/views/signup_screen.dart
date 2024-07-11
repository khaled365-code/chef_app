import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/shared_button.dart';
import '../widgets/custom_outline_text_field.dart';
import '../widgets/health_certificate_dot_container.dart';
import '../widgets/name_and_text_field_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state)
      {
        // TODO: implement listener
      },
      builder: (context, state) {
        final signupCubit = BlocProvider.of<SignupCubit>(context);
        return Scaffold(
          
          body: SafeArea(
            child: Stack(
              children:
              [
                AuthHeaderWidget(
                  title: 'Sign Up',
                  subTitle: 'Please sign up to get started',
                ),
                Form(
                    child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          width: MediaQuery
                              .sizeOf(context)
                              .width,
                          height: MediaQuery
                              .sizeOf(context)
                              .height * 579 / 812,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(start: 24.w),
                              child: Column(
                                children:
                                [
                                  SpaceWidget(height: 25,),
                                  ImagePickerWidget(),
                                  SpaceWidget(height: 25,),
                                  NameAndTextFieldWidget(
                                    title: 'Name',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your name';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.nameController,
                                        hintText: 'John doe',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),

                                  NameAndTextFieldWidget(
                                    title: 'Phone',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your phone number';
                                          }
                                          else
                                          {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.phoneController,
                                        hintText: '+201013328223',
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),

                                  NameAndTextFieldWidget(
                                    title: 'Email',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your email';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.emailController,
                                        hintText: 'example@gmail.com',
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),

                                  NameAndTextFieldWidget(
                                    title: 'Password',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your password';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.passwordController,
                                        hintText: '* * * * * * * * * *',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),


                                  NameAndTextFieldWidget(
                                    title: 'Re-Type Password',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your password';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.confirmPassController,
                                        hintText: '* * * * * * * * * *',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),

                                  NameAndTextFieldWidget(
                                    title: 'Brand Name',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your brand name';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.brandNameController,
                                        hintText: 'ChefLegacy',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),

                                  NameAndTextFieldWidget(
                                    title: 'Min Charge',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your minimum charge';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.minimumChargeController,
                                        hintText: '1000',
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24,),

                                  NameAndTextFieldWidget(
                                    title: 'Description',
                                    textField: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your brand description';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {

                                        },
                                        controller: signupCubit.descriptionController,
                                        hintText: 'fast food brand',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 24.h,),

                                  HealthCertificateDotContainer(),


                                  Padding(
                                    padding:  EdgeInsetsDirectional.only(end: 24.w),
                                    child: SharedButton(
                                      btnText: 'Sign Up',
                                      onPressessed: ()
                                      {

                                      },
                                    ),
                                  ),

                                  SpaceWidget(height: 30),






                                ],
                              ),
                            ),
                          ),

                        )

                    ))


              ],
            ),
          ),
        );
      },
    );
  }
}
