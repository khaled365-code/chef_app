


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';

class CertificationAppBar extends StatelessWidget {
  const CertificationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: Center(
          child: SvgPicture.asset(
              width: 8,
              ImageConstants.arrowBackIcon,
              colorFilter: ColorFilter.mode(AppColors.c181C2E,
                  BlendMode.srcIn)),
        ),
      ),
    );
  }
}
