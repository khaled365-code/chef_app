

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/app_colors.dart';

class SharedLoadingIndicator extends StatelessWidget {
  const SharedLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: 30.w,
        height: 30.w,
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 2.w,
        ));
  }
}
