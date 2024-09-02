import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:chef_app/features/auth/presentation/widgets/options_for_account_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/custom_outline_text_field.dart';
import '../widgets/health_certificate_dot_container.dart';
import '../widgets/name_and_text_field_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state)
      {
        if(state is SignUpSuccessState)
          {
            buildScaffoldMessenger(context: context, msg: state.message);
           navigate(context: context, route: Routes.loginScreen);
          }
        if (state is SignUpFailureState)
          {
            if(state.theError.error!=null)
            {
              buildScaffoldMessenger(context: context, msg: state.theError.error!.toString().substring(1,state.theError.error!.toString().length-1));
            }
            else
            {
              buildScaffoldMessenger(context: context, msg: state.theError.errorMessage!);
            }
          }
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
                  key: signupCubit.signupFormKey,
                    child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          width: MediaQuery
                              .sizeOf(context)
                              .width,
                          height: MediaQuery.sizeOf(context).height*550/812,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.r),
                              topLeft: Radius.circular(25.r),
                            ),
                          ),
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(child: SpaceWidget(height: 25,)),
                              SliverToBoxAdapter(
                                child: Center(child: signupCubit.signupImage == null ?
                                GestureDetector(
                                  child: ImagePickerWidget(
                                    onCameraTap: ()
                                    {
                                      imagePick(imageSource: ImageSource.camera).then((value) {
                                          signupCubit.uploadSignupImage(image: value!);
                                        },);
                                      Navigator.pop(context);
                                    },
                                    onGalleryTap: ()
                                    {
                                      imagePick(imageSource: ImageSource.gallery).then((value) {
                                          signupCubit.uploadSignupImage(image: value!);
                                        },);
                                      Navigator.pop(context);

                                    },

                                  ),
                                ):ImagePickerWidget(
                                  onDeletePhotoTap: ()
                                  {
                                    signupCubit.deleteSignupImage();
                                  },
                                  imagePath: signupCubit.signupImage!.path,
                                )),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 25,)),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Name',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your name';
                                          }
                                          if(value.length > 20)
                                            {
                                              return 'name length must be less than or equal to 20';
                                            }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);
                                        },
                                        controller: signupCubit.nameController,
                                        hintText: 'example: John doe',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Phone',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your phone number';
                                          }
                                          if(value.length < 10)
                                            {
                                              return 'phone length must be at least 10 characters long';
                                            }
                                          else
                                          {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);
                                        },
                                        controller: signupCubit.phoneController,
                                        hintText: 'example: +201013328223',
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Email',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your email';
                                          }
                                          if(EmailValidator.validate(value)==false)
                                            {
                                              return 'invalid email address';
                                            }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);

                                        },
                                        controller: signupCubit.emailController,
                                        hintText: 'example@gmail.com',
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Password',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        obscureText: signupCubit.passwordSecureText,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            signupCubit
                                                .changePasswordIconShape();
                                          },
                                          child: Icon(
                                              signupCubit.passwordSuffixIcon,color: AppColors.cB4B9CA,),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your password';
                                          }
                                          else
                                          {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);

                                        },
                                        controller: signupCubit.passwordController,
                                        hintText: '* * * * * * * * * *',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),


                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Re-Type Password',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        obscureText: signupCubit.confirmPasswordSecureText,
                                        suffixIcon: GestureDetector(
                                          onTap: ()
                                          {
                                            signupCubit.changeConfirmPasswordIconShape();
                                          },
                                          child: Icon(
                                              signupCubit.confirmPasswordSuffixIcon,color: AppColors.cB4B9CA,),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must confirm your password';
                                          }
                                          else if(signupCubit.passwordController.text != signupCubit.confirmPassController.text)
                                            {
                                              return 'Passwords does not match';
                                            }
                                          else
                                          {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);

                                        },
                                        controller: signupCubit.confirmPassController,
                                        hintText: '* * * * * * * * * *',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Brand Name',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your brand name';
                                          }
                                          if(value.length<3)
                                            {
                                              return 'brand name length must be at least 3 characters long';
                                            }
                                          if(value.length>20)
                                            {
                                              return 'brand name length must be less than or equal to 20 characters long';
                                            }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);

                                        },
                                        controller: signupCubit.brandNameController,
                                        hintText: 'example: ChefLegacy',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Min Charge',
                                    childWidget: Padding(
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
                                          checkValidationForRegistration(signupCubit, context);

                                        },
                                        controller: signupCubit.minimumChargeController,
                                        hintText: 'example: 1000',
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(start: 24.w),
                                  child: NameAndTextFieldWidget(
                                    title: 'Description',
                                    childWidget: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 24.w),
                                      child: CustomOutlineTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You must enter your brand description';
                                          }
                                          if(value.length < 20)
                                          {
                                            return 'discription length must be at least 20 characters long';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                        onFieldSubmitted: (value)
                                        {
                                          checkValidationForRegistration(signupCubit, context);

                                        },
                                        controller: signupCubit.descriptionController,
                                        hintText: 'example: fast food brand',
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(child: SpaceWidget(height: 24.h,)),

                             
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                  children:
                                  [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: 24.w),
                                      child: signupCubit.healthCertificateImage==null?
                                      HealthCertificateDotContainer(
                                       onCameraTap: ()
                                        {
                                          imagePick(imageSource: ImageSource.camera).then((value) {
                                            signupCubit.uploadHealthCertificateImage(image: value!);
                                          },);
                                          Navigator.pop(context);
                                        },
                                        onGalleryTap: ()
                                        {
                                          imagePick(imageSource: ImageSource.gallery).then((value) {
                                            signupCubit.uploadHealthCertificateImage(image: value!);
                                          },);
                                          Navigator.pop(context);
                                        },
                                      ):
                                      HealthCertificateDotContainer(
                                        onDeletePhotoPressessed: ()
                                        {
                                          signupCubit.deleteHealthCertificateImage();
                                        },
                                        imagePath: signupCubit.healthCertificateImage!.path,
                                      ),
                                    ),
                                    Expanded(child: SpaceWidget(height: 47,)),
                                  ],
                                ),
                              ),
                              state is SignUpLoadingState?
                              SliverToBoxAdapter(
                                child: Center(
                                  child: SizedBox(
                                      width: 30.w,
                                      height: 30.w,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                        strokeWidth: 2.w,

                                      )),
                                ),
                              ):
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding:  EdgeInsetsDirectional.only(end: 24.w,start: 24.w),
                                  child: SharedButton(
                                    btnText: 'Sign Up',
                                    onPressessed: ()
                                    {
                                      checkValidationForRegistration(signupCubit, context);
                                    },
                                  ),
                                ),
                              ),

                              SliverToBoxAdapter(child: SpaceWidget(height: 24.h,)),

                              SliverToBoxAdapter(
                                child: OptionsForAccountWidget(
                                  title1: 'Already have an account?',
                                  title2: ' sign in',
                                  onActionTapped: ()
                                  {
                                    navigate(context: context, route: Routes.loginScreen);
                                  },
                                ),
                              ),


                              SliverToBoxAdapter(child: SpaceWidget(height: 30)),
                            ],
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

  void checkValidationForRegistration(SignupCubit signupCubit, BuildContext context) {
    if (signupCubit.signupFormKey.currentState!.validate())
    {
      if(signupCubit.healthCertificateImage==null)
      {
        buildScaffoldMessenger(context: context, msg: 'Please upload image of your certificate to register as chef with us');
      }
      else
      {
        signupCubit.signupFun(
            name: signupCubit.nameController.text, phone: signupCubit.phoneController.text,
            email: signupCubit.emailController.text, password: signupCubit.passwordController.text,
            passwordConfirmation: signupCubit.confirmPassController.text,
            brandName: signupCubit.brandNameController.text,
            minimumCharge: double.parse(signupCubit.minimumChargeController.text),
            description: signupCubit.descriptionController.text);
      }
    }
  }
}
