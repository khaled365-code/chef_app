

import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key, required this.title, required this.subTitle, this.hasBackButton, this.incomingContext});

  final String title,subTitle;
final bool? hasBackButton;
final BuildContext? incomingContext;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
              color: Color(0xff1E1E2E),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*(118/812).h,),
              Text(title,style: AppTextStyles.bold30(context).copyWith(color: Color(0xffFFFFFF)),),
              SpaceWidget(height: 3,),
              Text(subTitle,style: AppTextStyles.regular16(context).copyWith(color: Color(0xffFFFFFF)),),

            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
            child: Transform.rotate(
              angle: -.2,
                child: Image.asset(ImageConstants.splashTopElipsisImage,color:Colors.white,))),
        Align(
            alignment: AlignmentDirectional.topEnd,
            child: Image.asset(ImageConstants.loginOtherElipsisImage,color:Colors.grey.withOpacity(.2),)),

        hasBackButton==true?
        PositionedDirectional(
          top: MediaQuery.sizeOf(context).height*(35/812),
          start: 24.w,
          child: GestureDetector(
            onTap: ()
            {
              Navigator.pop(incomingContext!);
            },
            child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 15.w,end: 18.w),
                child: SvgPicture.asset(ImageConstants.arrowBackIcon,),
              ),
                      ),
          ),
        ):SizedBox.shrink()

      ],
    );
  }
}
