
import 'package:chef_app/chef_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130.w,
          height: 130.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cFFC6AE,
          ),
        ),
        PositionedDirectional(
          bottom: -3.h,
          end: 3.w,
            child: Container(
              width: 41.w,
              height: 41.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: SvgPicture.asset(
                  ImageConstants.pencilEditIcon,
                ),
              ),
            ))
      ],
    );
  }
}
