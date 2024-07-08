


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/features/menu/data/models/MealModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/menu/data/models/Meals.dart';
import '../utilis/app_text_styles.dart';

class RectangleFoodContainer extends StatelessWidget {


  final Meals meals;

  const RectangleFoodContainer({super.key, required this.meals});
  @override
  Widget build(BuildContext context) {
  return Container(
    width: 266,
    height: 229,
    decoration: BoxDecoration(
      color: AppColors.white,
        borderRadius: BorderRadius.circular(16)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children:
          [
            Container(
                height: 136,
                width: 266,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(meals.images![0])),
                    shape: BoxShape.rectangle),
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.white,
                    ),
                    radius: 20,
                  ),),
            ],

        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 16),
              child: Text(meals.name!,style: AppTextStyles.font16.copyWith(color: AppColors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,top: 5),
              child: Row(
                children:
                [
                  Image.asset(imageConstants.smallFood),
                  Text(meals.category!,style: AppTextStyles.font14.copyWith(color: AppColors.grey),),
                  SizedBox(width: 10,),
                  Row(
                    children: [
                      Text('\$ ',style: AppTextStyles.font14.copyWith(color: AppColors.primary,),),
                      Text('${meals.price!} LE',style: AppTextStyles.font14.copyWith(color: AppColors.grey),),

                    ],
                  ),


                ],
              ),
            ),
          ],
        ),

      ],
    ),

  );
  }
}
