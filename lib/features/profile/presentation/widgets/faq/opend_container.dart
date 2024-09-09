

import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenedContainer extends StatefulWidget {
  const OpenedContainer({super.key});

  @override
  State<OpenedContainer> createState() => _OpenedContainerState();
}

class _OpenedContainerState extends State<OpenedContainer> {
  bool containerIsOpen=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
       containerIsOpen=!containerIsOpen;
       setState(() {

       });
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 16.h,start: 16.w,bottom: 11.h,end: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.transparent,
          border: Border.all(
            color: AppColors.cD9D9D9,
            width: 2.w
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('How to create a account?',
                  style: AppTextStyles.bold14(context).copyWith(
                    color: AppColors.black
                  ),),
                Spacer(),
               containerIsOpen==false? Icon(Icons.add,color: AppColors.primaryColor,):Icon(Icons.remove,color: AppColors.primaryColor,)
              ],
            ),
            containerIsOpen==true?
             Column(
               children: [
                 SpaceWidget(height: 8,),
                 Text('Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.',
                 style: AppTextStyles.regular14(context).copyWith(color: AppColors.c757575),)
               ],
             ):SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
