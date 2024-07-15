

import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';

class OtpCodeContainer extends StatelessWidget {
  const OtpCodeContainer({super.key, required this.singleContainerController});


  final TextEditingController singleContainerController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      child: TextFormField(
        controller: singleContainerController,
        cursorColor: AppColors.c1E1E2E,
        keyboardType: TextInputType.number,
        onChanged: (value)
        {
          if(value.length==1)
            {
              FocusScope.of(context).nextFocus();
            }
        },
        validator: (value)
        {
          if(value!.isEmpty)
            {
              return 'send digit!';
            }
          else
            {
              return null;
            }
        },
        style: AppTextStyles.bold16(context).copyWith(color: AppColors.c32343E),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
           FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          // hintStyle: AppTextStyles.regular14(context).copyWith(color: AppColors.cA0A5BA),
          // hintText: '0',
          filled: true,
            fillColor:  AppColors.cF0F5FA ,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.transparent),
            ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.transparent),

          )
        ),
      ),
    );
  }
}
