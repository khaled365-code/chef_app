
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class HealthCertificateDotContainer extends StatelessWidget {
  const HealthCertificateDotContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 24.w)
      ,child: Container(
      height: 200.h,
      decoration: DottedDecoration(
          shape: Shape.box,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Container(
              width: 55.w,
              height: 55.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Icon(
                  Icons.upload_file_outlined,
                  color: AppColors.white,
                  size: 25.sp,
                ),
              ),
            ),
            SpaceWidget(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Click to Upload',
                    style: AppTextStyles.regular16(context).copyWith(color: Color(0xff32343E))
                ),
                Text(
                  ' Health Certificate',
                  style: AppTextStyles.regular16(context).copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),

          ]
      ),
    ),
    );
  }
}
