



import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/menu/data/models/Meals.dart';
import '../global_models/food_categories_model/FoodCategoriesModel.dart';
import '../utilis/app_text_styles.dart';

class RhombicContainer extends StatelessWidget {


  final FoodCategoriesModel foodCategoriesModel;

  const RhombicContainer({super.key,required this.foodCategoriesModel});

  Widget build(BuildContext context) {

    return Container(
      width: 69,
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(35)
      ),
      child: Column(
        children: [
          SizedBox(height: 5,),
          CircleAvatar(backgroundImage: AssetImage(foodCategoriesModel.image),radius: 25,backgroundColor: AppColors.white),
          SizedBox(height: 5,),
          Text(foodCategoriesModel.name,style: AppTextStyles.font16.copyWith(color: AppColors.white),)
        ],
      ),
    );
  }
}
