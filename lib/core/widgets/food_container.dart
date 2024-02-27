


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key, required this.text1, required this.text2, required this.price, this.width=220, this.height=250, this.color=AppColors.white, this.imageLeft=10, this.imageTop=-50, this.textBottom=40, this.textLeft=60, required this.imageUrl, this.imageRadius=40, this.minusRight=30, this.minusBottom=10, this.borderRadiusValue=20,required this.onTap,});

  final String text1;
  final String text2;
  final String price;
  final double? width;
  final double? height;
  final Color? color;
  final double? imageLeft;
  final double? imageTop;
  final double? textBottom;
  final double? textLeft;
  final String imageUrl;
  final double? imageRadius;
  final double? minusRight;
  final double? minusBottom;
  final double? borderRadiusValue;
  final void Function() onTap;




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
        Positioned(top: imageTop,left:imageLeft,child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(imageUrl),radius: imageRadius, )),
        Positioned(
          bottom: textBottom,
          left: textLeft,
          child: Expanded(
            child: Column(
              children: [
                Text(text1,style: AppTextStyles.font24.copyWith(color: AppColors.black),),
                Text(text2,style: AppTextStyles.font24.copyWith(color: AppColors.black),),
                SizedBox(height: 15,),
                Text(price,style: AppTextStyles.font16.copyWith(color: AppColors.primary),),

              ],
            ),
          ),
        ),
        Positioned(bottom:minusBottom ,right:minusRight,child: GestureDetector(onTap: onTap,child: Container(width: 30,height: 30,decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: AppColors.grey2,width: 3)),child: Icon(Icons.remove,color: AppColors.primary),))),

      ],
    );
  }
}