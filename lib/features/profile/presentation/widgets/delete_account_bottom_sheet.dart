
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key, required this.bottomSheetTitle, this.onOkPressed});

  final String bottomSheetTitle;
  final  void Function()? onOkPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 34.2.w,
            height: 35.h,
            decoration:BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: SvgPicture.asset(ImageConstants.closeIcon),
            ),
          ),
        ),
        SpaceWidget(height: 10,),
        Container(
          height: MediaQuery.sizeOf(context).height*(361/812),
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.white,
          child: Column(
            children: [
              SpaceWidget(height: 7,),
              Text(bottomSheetTitle,style: AppTextStyles.bold18(context).copyWith(color: AppColors.c181C2E),),
              SpaceWidget(height: 8,),
              SizedBox(
                width: 103.w,
                  height: 103.h,
                  child: Image.asset(ImageConstants.deleteAccountGif)),
              SpaceWidget(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: FittedBox(child: Text('Are you sure you want to delete your account ?',style: AppTextStyles.bold18(context).copyWith(color: AppColors.c00243C,),)),
              ),
              SpaceWidget(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text('Please be aware that once you delete your account, you will permanently lose\nall data within the app.',style: AppTextStyles.regular15(context).copyWith(color: AppColors.cA4ACAD,),),
              ),
             Spacer(),
              SharedButton(
                btnTextStyle: AppTextStyles.bold17(context).copyWith(
                  fontSize: 19,
                  color: AppColors.white,
                ),
                  onPressessed: onOkPressed,
                btnText: 'Delete Account',),
              SpaceWidget(height: 20,),

            ]
             )
        ),
      ],
    );
  }
}
