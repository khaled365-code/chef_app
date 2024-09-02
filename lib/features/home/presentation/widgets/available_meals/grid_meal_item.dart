import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/meals.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import 'favourite_meal_container_shape.dart';

class GridMealItem extends StatelessWidget {
  const GridMealItem({super.key, required this.meal, required this.mealsList, required this.index,});

  final Meals meal;
  final List<Meals> mealsList;
  final int index;

  @override
  Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.cF6F6F6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 17.w, end: 14.w),
                child: Container(
                  height: 84.h,
                  decoration: meal.images!.first.isNotEmpty ? BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              meal.images!.first
                          ), fit: BoxFit.cover)
                  ) : null,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceWidget(height: 15,),
                    Text(
                        meal.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bold15(context).copyWith(
                            color: AppColors.c32343E
                        )),
                    SpaceWidget(height: 5,),
                    Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        meal.description!,
                        style: AppTextStyles.regular13(context).copyWith(
                            color: AppColors.c646982
                        )),
                    SpaceWidget(height: 8,),
                    Row(
                      children: [
                        Text('\$${meal.price}'.toString(), style: AppTextStyles
                            .bold15(context).copyWith(
                            color: AppColors.c32343E
                        )),
                        Spacer(),
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 10.w),
                          child: GestureDetector(
                                onTap: () async
                                {
                                  HomeScreenCubit.get(context).changeMealFavouriteShape(index: index,mealList: mealsList);
                                },
                                child: AddMealContainerShapeToFavourites(
                                  isActivated: meal.itemIsSelected,
                                ),
                              )
                        )
                      ],
                    ),
                    SpaceWidget(height: 15,),

                  ],
                ),
              ),


            ],
          ),
        );
  }
}


