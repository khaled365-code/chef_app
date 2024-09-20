

import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionDialog extends StatelessWidget {
  const NoInternetConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cF0F0F0,
      contentPadding: EdgeInsetsDirectional.zero,

      title: Text('No internet Connection',style: AppTextStyles.bold20(context).copyWith(
        color: AppColors.c181C2E
      ),),

      content: Column(
        mainAxisSize: MainAxisSize.min,
         children:
         [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Text('Please check your internet connection and try again.',
             style: AppTextStyles.regular14(context).copyWith(
               color: AppColors.c181C2E
             ),),
           ),
           SpaceWidget(height: 10,),
           Divider(
             color: AppColors.cD3D3D3,
             thickness: 3,
           ),
         ],
      ),
      actions: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Center(
            child: Text('Ok',style: AppTextStyles.bold20(context).copyWith(
              color: AppColors.primaryColor
            )),
          ),
        )
      ],
    );
  }
}
