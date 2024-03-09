


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../features/menu/data/models/Meals.dart';
import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key, this.width=220, this.height=250, this.color=AppColors.white, this.imageLeft=10, this.imageTop=-50, this.textBottom=40, this.textLeft=60, this.imageRadius=40, this.minusLeft=10, this.minusBottom=10, this.borderRadiusValue=20, required this.meals, required this.deleteOnTap, required this.updateMealOnTap, this.updateMealRightPos,});


  final double? width;
  final double? height;
  final Color? color;
  final double? imageLeft;
  final double? imageTop;
  final double? textBottom;
  final double? textLeft;
  final double? imageRadius;
  final double? minusLeft;
  final double? minusBottom;
  final double? borderRadiusValue;
  final void Function() deleteOnTap;
  final Meals? meals;
  final void Function() updateMealOnTap;
  final double? updateMealRightPos;






  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadiusValue!),


            )
        ),
        Positioned(top: imageTop,left:imageLeft,child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(meals!.images![0]),radius: imageRadius, )),
        Positioned(
          bottom: textBottom,
          left: textLeft,
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(meals!.name!,style: AppTextStyles.font24.copyWith(color: AppColors.black,),textAlign: TextAlign.center),
                SizedBox(height: 5,),
                Text(meals!.description!,style: AppTextStyles.font16.copyWith(color: AppColors.grey),),
                SizedBox(height: 5,),
                Text(meals!.price.toString()+' LE',style: AppTextStyles.font14.copyWith(color: AppColors.primary),),

              ],
            ),
          ),
        ),
        Positioned(bottom:minusBottom ,left:minusLeft,child: GestureDetector(onTap: deleteOnTap,child: Container(width: 30,height: 30,decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: AppColors.grey2,width: 3)),child: Icon(Icons.remove,color: AppColors.primary),))),

        Positioned(bottom:minusBottom ,right:updateMealRightPos,child: GestureDetector(onTap: updateMealOnTap,child: Container(width: 30,height: 30,decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: AppColors.grey2,width: 3)),child: Icon(Icons.update_outlined,color: AppColors.primary),))),


      ],
    );
  }
}