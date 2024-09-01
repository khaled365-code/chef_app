


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class AllCategoriesRow extends StatelessWidget {
  const AllCategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 24.w, end: 24.w),
      child: Row(
        children: [
          Text('All Categories', style: AppTextStyles.regular17(
              context).copyWith(color: AppColors.c32343E),),
          Spacer(),
          Text('See All', style: AppTextStyles.regular16(
              context).copyWith(color: AppColors.c333333),),
          SpaceWidget(width: 10,),
          SvgPicture.asset(ImageConstants.seeAllNextIcon)
        ],
      ),
    );
  }
}
