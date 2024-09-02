import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/core/widgets/custom_outline_text_field.dart';
import 'package:chef_app/core/widgets/name_and_text_field_widget.dart';
import 'package:chef_app/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/space_widget.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileCubit = BlocProvider.of<EditProfileCubit>(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 24.w, end: 24.w),
                      child: Column(
                        children: [
                          SpaceWidget(height: 24,),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.cECF0F4
                                  ),
                                  child: Center(child: SvgPicture.asset(
                                      ImageConstants.arrowBackIcon)),
                                ),
                              ),
                              SpaceWidget(width: 16,),
                              Text(
                                'Edit Profile', style: AppTextStyles.regular17(
                                  context).copyWith(color: AppColors.c181C2E),),
                            ],
                          ),
                          SpaceWidget(height: 25,),
                          ImagePickerWidget(
                          imagePath: editProfileCubit.newProfilePhoto?.path,
                          onGalleryTap: ()
                            {
                              imagePick(imageSource: ImageSource.gallery).then(
                                (value) {
                                  editProfileCubit.updateProfilePhoto(image: value!);
                                },
                              );
                              Navigator.pop(context);
                            },
                            onCameraTap: ()
                            {
                              imagePick(imageSource: ImageSource.camera).then((value)
                                {
                                  editProfileCubit.updateProfilePhoto(image: value!);
                                },
                              );
                              Navigator.pop(context);
                            },
                            onDeletePhotoTap: ()
                            {
                              editProfileCubit.deleteProfilePhoto();
                            },
                          ),
                          SpaceWidget(height: 30,),
                          NameAndTextFieldWidget(
                              title: 'Full Name',
                              childWidget: CustomOutlineTextField(
                                  controller: editProfileCubit.nameController,
                                   keyboardType: TextInputType.name,
                                onFieldSubmitted: (value)
                                {

                                },

                              )),
                          SpaceWidget(height: 24,),
                          NameAndTextFieldWidget(
                              title: 'Phone Number',
                              childWidget: CustomOutlineTextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  editProfileCubit.phoneMaskFormatter,
                                ],
                                controller: editProfileCubit.phoneController,
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (value)
                                {

                                },

                              )),
                          SpaceWidget(height: 24,),
                          NameAndTextFieldWidget(
                              title: 'Brand Name',
                              childWidget: CustomOutlineTextField(
                                controller: editProfileCubit.brandNameController,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (value)
                                {

                                },

                              )),
                          SpaceWidget(height: 24,),
                          NameAndTextFieldWidget(
                              title: 'Min Charge',
                              childWidget: CustomOutlineTextField(
                                controller: editProfileCubit.minChargeController,
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (value)
                                {

                                },

                              )),
                          SpaceWidget(height: 24,),
                          NameAndTextFieldWidget(
                              title: 'Description',
                              childWidget: CustomOutlineTextField(
                                controller: editProfileCubit.discController,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (value)
                                {

                                },

                              )),






                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                       Expanded(child: SpaceWidget(height: 32,)),
                        SharedButton(
                            btnText: 'SAVE',
                          btnTextStyle: AppTextStyles.bold16(context).copyWith(
                            color: AppColors.white
                          ),
                          onPressessed: ()
                          {

                          },
                        ),
                        SpaceWidget(height: 30,),
                      ],
                    ),
                  )

                ],
              )),
        );
      },
    );
  }
}
