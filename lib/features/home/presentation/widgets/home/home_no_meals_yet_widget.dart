

import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/space_widget.dart';

class HomeNoMealsYetWidget extends StatelessWidget {
  const HomeNoMealsYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Image.asset(ImageConstants.orderCarImage,),
       SpaceWidget(height: 27,),
       Text('No Meals yet',style: AppTextStyles.extraBold24(context).copyWith(
         color: AppColors.c32343E
       ),),
       SpaceWidget(height: 10,),
       Text('Try to add some meals\nto see it in the list ',style: AppTextStyles.regular16(context).copyWith(
         color: AppColors.c646982
       ),),
     ], 
    );
  }
}
