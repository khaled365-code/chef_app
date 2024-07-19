


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/meals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeMealContainer extends StatelessWidget {
  const HomeMealContainer({super.key, required this.meal});

  final Meals meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 137.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: meal.images!.isNotEmpty?
              DecorationImage(
                  image: CachedNetworkImageProvider(
                    meal.images!.first,
                  ),fit: BoxFit.fill):null
            ),),
          SpaceWidget(height: 8,),
          Text(meal.name!,style: AppTextStyles.regular20(context).copyWith(
            color: AppColors.c181C2E
          ),),
          SpaceWidget(height: 5,),
          Text(meal.description!,style: AppTextStyles.regular14(context).copyWith(
              color: AppColors.cA0A5BA
          ),),
          SpaceWidget(height: 14,),
          Row(
            children: [
              SvgPicture.asset(ImageConstants.priceIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
              SpaceWidget(width: 4,),
              Text(meal.price.toString(),style: AppTextStyles.bold16(context).copyWith(
                  color: AppColors.c181C2E
              ),),
              SpaceWidget(width: 24,),
              SvgPicture.asset(ImageConstants.categoryIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
              SpaceWidget(width: 4,),
              Text(meal.category!,style: AppTextStyles.regular14(context).copyWith(
                  color: AppColors.c181C2E
              ),),
              SpaceWidget(width: 24,),
              SvgPicture.asset(ImageConstants.userChefIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
              SpaceWidget(width: 4,),
              Text(meal.chefId!.brandName!,style: AppTextStyles.regular14(context).copyWith(
                  color: AppColors.c181C2E
              ),),
            ],
          )




        ],
      ),
    );
  }
}
