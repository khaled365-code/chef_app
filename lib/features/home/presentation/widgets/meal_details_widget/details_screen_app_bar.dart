

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class DetailsScreenAppBar extends StatelessWidget {
  const DetailsScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()
            {
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
          Text('Details',style: AppTextStyles.regular17(context).copyWith(
              color: AppColors.c181C2E
          ))
        ],
      ),
    );
  }
}
