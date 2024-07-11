

import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/space_widget.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key, required this.title, required this.subTitle});

  final String title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
              color: Color(0xff1E1E2E),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              topLeft: Radius.circular(12.r),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*(85/812),),
              Text(title,style: AppTextStyles.bold30(context).copyWith(color: Color(0xffFFFFFF)),),
              SpaceWidget(height: 3,),
              Text(subTitle,style: AppTextStyles.regular16(context).copyWith(color: Color(0xffFFFFFF)),),

            ],
          ),
        ),
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Image.asset(ImageConstants.splashTopElipsisImage,color:Colors.white,)),
        Align(
            alignment: AlignmentDirectional.topEnd,
            child: Image.asset(ImageConstants.loginOtherElipsisImage,color:Colors.grey.withOpacity(.2),)),
      ],
    );
  }
}
