


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../features/menu/data/models/Meals.dart';
import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key, this.width=220, this.height=250, this.color=AppColors.white, this.imageLeft=10, this.imageTop=-50, this.textBottom=40, this.textLeft=60, this.imageRadius=40, this.minusRight=30, this.minusBottom=10, this.borderRadiusValue=20,required this.onTap, required this.meals,});


  final double? width;
  final double? height;
  final Color? color;
  final double? imageLeft;
  final double? imageTop;
  final double? textBottom;
  final double? textLeft;
  final double? imageRadius;
  final double? minusRight;
  final double? minusBottom;
  final double? borderRadiusValue;
  final void Function() onTap;
  final Meals? meals;





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
              children: [
                Text(meals!.name!,style: AppTextStyles.font24.copyWith(color: AppColors.black),),
                Text(meals!.description!,style: AppTextStyles.font24.copyWith(color: AppColors.black),),
                SizedBox(height: 15,),
                Text(meals!.price.toString(),style: AppTextStyles.font16.copyWith(color: AppColors.primary),),

              ],
            ),
          ),
        ),
        Positioned(bottom:minusBottom ,right:minusRight,child: GestureDetector(onTap: onTap,child: Container(width: 30,height: 30,decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: AppColors.grey2,width: 3)),child: Icon(Icons.remove,color: AppColors.primary),))),

      ],
    );
  }
}