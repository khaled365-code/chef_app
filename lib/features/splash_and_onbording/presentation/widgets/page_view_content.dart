

import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/onboarding_data_model.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({super.key, required this.onboardingDataModel,});

  final OnboardingDataModel onboardingDataModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: 240.w,
            height: 290.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              image: DecorationImage(image: AssetImage(onboardingDataModel.image),fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 63.h,),
          Text(onboardingDataModel.title,style: AppTextStyles.extraBold24(context).copyWith(color: Color(0xff32343E)),),
          SizedBox(height: 18.h,),
          Text(onboardingDataModel.subtitle,style: AppTextStyles.regular16(context).copyWith(color: Color(0xff646982)),)
      
      
        ],
      ),
    );
  }
}
