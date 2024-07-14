

import 'package:chef_app/chef_app.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class OpenCameraOrGalleryContainer extends StatefulWidget {
  const OpenCameraOrGalleryContainer({super.key, this.onGalleryTap, this.onCameraTap});

  final Function()? onGalleryTap;
  final Function()? onCameraTap;


  @override
  State<OpenCameraOrGalleryContainer> createState() => _OpenCameraOrGalleryContainerState();
}

class _OpenCameraOrGalleryContainerState extends State<OpenCameraOrGalleryContainer> {



   bool isTapped1=true;
   bool isTapped2=false;



  _OpenCameraOrGalleryContainerState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          height: 190.h,
          decoration: BoxDecoration(

          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xfff09147),
                          Color(0xffebb551),
                        ],
                      begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter

                    )
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 15.w,top: 15.h),
                  child: Text('Complete action using',style: AppTextStyles.bold18(context).copyWith(color: AppColors.white),),
                ),
              ),
              Container(
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.cFFE6CA,
                ),
                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap:widget.onGalleryTap,
                        child: Container(
                         decoration:  BoxDecoration(
                             color: AppColors.white,
                             gradient: isTapped1==true?LinearGradient(
                                 colors: [
                                   Color(0xffa0b09d),
                                   Color(0xff628e9c),
                                 ],
                                 begin: AlignmentDirectional.topCenter,
                                 end: AlignmentDirectional.bottomCenter

                             ):null
                         ),
                          child: Column(
                            children: [
                              SpaceWidget(height: 20,),
                              SizedBox(
                                width: 50.w,
                                  height: 50.h,
                                  child: Image.asset(ImageConstants.galleryAndroidImage)),
                              SpaceWidget(height: 7,),
                              Text('Gallery',style: AppTextStyles.regular16(context).copyWith(color: isTapped1==true?AppColors.white: AppColors.black),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.onCameraTap,
                        child: Container(
                          decoration:  BoxDecoration(
                              color: AppColors.white,
                              gradient: isTapped2==true?LinearGradient(
                                  colors: [
                                    Color(0xffa0b09d),
                                    Color(0xff628e9c),
                                  ],
                                  begin: AlignmentDirectional.topCenter,
                                  end: AlignmentDirectional.bottomCenter

                              ):null
                          ),
                          child: Column(
                            children:
                            [
                              SpaceWidget(height: 20,),
                              SizedBox(
                                  width: 50.w,
                                  height: 50.h,
                                  child: Image.asset(ImageConstants.cameraAndroidImage)),
                              SpaceWidget(height: 7,),
                              Text('Camera',style: AppTextStyles.regular16(context).copyWith(color: isTapped2==true?AppColors.white: AppColors.black),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),

        ),
      ],
    );
  }

}
