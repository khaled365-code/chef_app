

import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../data/models/carousel_slider_data_model/carousel_slider_model.dart';

class CarouselContainerItem extends StatelessWidget {
  const CarouselContainerItem({super.key, required this.carouselSliderModel});

  final CarouselSliderModel carouselSliderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.w,top: 20.h,end: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(carouselSliderModel.textTitle,style: AppTextStyles.bold16(context).copyWith(color:
                  AppColors.white),),
                  SpaceWidget(height: 20,),
                  Container(
                    width: 150.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      shape: BoxShape.rectangle
                    ),
                    child: Center(child: Text(carouselSliderModel.btnText,style: AppTextStyles.bold14(context).copyWith(color: AppColors.primaryColor),)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Image.asset(
            height: 430.h,
            ImageConstants.chefImage,fit: BoxFit.fill,)),

          ]
          ));
  }
}
