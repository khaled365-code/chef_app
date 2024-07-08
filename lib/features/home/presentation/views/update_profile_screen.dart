


import 'dart:io';

import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/widgets/custom_progress_indicator.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/viewmodels/update_profile_cubit/update_profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/custom_image_picker.dart';
import '../../../../../core/widgets/outlined_text_field.dart';
import '../../../../../generated/l10n.dart';

class UpdateProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
    create: (context) => UpdateProfileCubit(homeRepoImplementation: HomeRepoImplementation(api: DioConsumer(dio: Dio()))),
    child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state)
      {
        if (state is UpdateProfileSuccessState)
          {
            showToast(msg: 'Profile updated successfully', toastStates: ToastStates.success);

          }
        else if(state is UpdateProfileFailureState)
          {
            showToast(msg: state.errorMessage, toastStates: ToastStates.success);

          }
      },
    builder: (context, state) {
    final updateProfileCubit=BlocProvider.of<UpdateProfileCubit>(context);
    return Form(
      key: updateProfileCubit.updateProfileKey,
      child: SafeArea(
        child: Scaffold
          (
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(imageConstants.editprofilegroup),
                    updateProfileCubit.profileImage==null?
                    Positioned(
                      left: 143,
                      top: 90,
                      child: CustomImagePickerAvatar(
                        image: imageConstants.khaled,
                        imageRadius: 45,
                        plusPaddingRightValue: 5,
                        plusPaddingBottomValue: 0,
                        galleryOnTap: ()
                        {
                          imagePick(imageSource: ImageSource.gallery).then((value) => updateProfileCubit.updateImage(value!));
                        },
                        cameraOnTap: ()
                        {
                          imagePick(imageSource: ImageSource.camera).then((value) => updateProfileCubit.updateImage(value!));

                        },
                      ),)
                        : Positioned(
                                  left: 143,
                                  top: 90,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(File(
                                        updateProfileCubit.profileImage!.path)),
                                    radius: 40,
                                  ),
                                ),

                          Positioned(
                      top: 190,
                      left: 120,
                      child: Column(
                        children: [
                          Text('Khaled Mohamed',style: AppTextStyles.font16.copyWith(color: AppColors.black),),
                          SizedBox(height: 10,),
                          Text(S.of(context).editProfile,style: AppTextStyles.font14.copyWith(color: AppColors.grey),),

                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      OutlinedTextField(
                        hintText: S.of(context).name,
                        textInputType: TextInputType.text,
                        controller: updateProfileCubit.nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).please_enter_name;
                          }
                          return null;
                        },
                        fillColor: AppColors.grey2,
                        top: 30,




                      ),
                      SizedBox(height: 20,),
                      OutlinedTextField(
                        hintText: S.of(context).phone_number,
                        textInputType: TextInputType.phone,
                        controller: updateProfileCubit.phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).please_enter_phone;
                          }
                          return null;
                        },
                        fillColor: AppColors.grey2,
                        top: 30,




                      ),
                      SizedBox(height: 20,),
                      OutlinedTextField(
                      hintText: S.of(context).brandname,
                      textInputType: TextInputType.text,
                      controller: updateProfileCubit.brandController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).pleaseEnterBrandName;
                        }
                        return null;
                      },
                      fillColor: AppColors.grey2,
                        top: 30,




                    ),
                      SizedBox(height: 20,),
                      OutlinedTextField(
                      hintText: S.of(context).mincharge,
                      textInputType: TextInputType.number,
                      controller: updateProfileCubit.chargeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).pleaseEnterMinumumCharge;
                        }
                        return null;
                      },
                      fillColor: AppColors.grey2,
                        top: 30,




                    ),
                      SizedBox(height: 20,),
                      OutlinedTextField(
                      hintText: S.of(context).descriptiontextfield,
                      textInputType: TextInputType.text,
                      controller: updateProfileCubit.descController,
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
                      fillColor: AppColors.grey2,
                        top: 30,




                    ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Center(
                          child: state is UpdateProfileLoadingState ?  CustomProgressIndicator() :
                          state is UpdateProfileFailureState ?
                          SharedButton(
                              text: S.of(context).update,
                              width: 248,
                              height: 60,
                              textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                              borderRadius: BorderRadius.circular(45),
                              onPressed: ()
                              {
                                if(updateProfileCubit.updateProfileKey.currentState!.validate())
                                  {
                                    updateProfileCubit.updateProfile();
                                  }
                              },
                              buttonColor: AppColors.primary) :
                          SharedButton(
                              text: S.of(context).update,
                              width: 248,
                              height: 60,
                              textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                              borderRadius: BorderRadius.circular(45),
                              onPressed: ()
                              {
                                if(updateProfileCubit.updateProfileKey.currentState!.validate())
                                {
                                  updateProfileCubit.updateProfile();
                                }
                              },
                              buttonColor: AppColors.primary) ,
                        ),
                      )



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