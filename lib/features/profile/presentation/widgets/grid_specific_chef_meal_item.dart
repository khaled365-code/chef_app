

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../data/models/specific_chef_meals_model/meals.dart';

class GridSpecificChefMealsItem extends StatelessWidget {
  const GridSpecificChefMealsItem({super.key, required this.meal});

  final SpecificChefMeals meal;


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GetSpecificChefMealsCubit, GetSpecificChefMealsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 17.w, end: 14.w),
                child: Container(
                  height: 84,
                  decoration: meal.images!.isNotEmpty ? BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              meal.images!.first
                          ), fit: BoxFit.fill)
                  ) : null,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceWidget(height: 15,),
                    Text(meal.name!,
                        style: AppTextStyles.bold15(context).copyWith(
                            color: AppColors.c32343E
                        )),
                    SpaceWidget(height: 5,),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(meal.description!,
                          style: AppTextStyles.regular13(context).copyWith(
                              color: AppColors.c646982
                          )),
                    ),
                    SpaceWidget(height: 8,),
                    Row(
                      children: [
                        Text('\$${meal.price}'.toString(), style: AppTextStyles
                            .bold15(context).copyWith(
                            color: AppColors.c32343E
                        )),
                        Spacer(),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.only(end: 10.w),
                        //   child: GestureDetector(
                        //     onTap: () async
                        //     {
                        //       showDialog(context: context, builder: (context) => AlertDialog(
                        //         title: Center(
                        //           child: Text('Warning',
                        //               style: AppTextStyles.bold18(context)
                        //                   .copyWith(
                        //                   color: AppColors.c32343E
                        //               )),
                        //         ),
                        //         content: Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Text('Are you sure',
                        //                 style: AppTextStyles.regular16(context)
                        //                     .copyWith(
                        //                     color: AppColors.c646982
                        //             )),
                        //             SpaceWidget(height: 5,),
                        //             Text('you want to delete this meal?',
                        //                 style: AppTextStyles.regular16(context)
                        //                     .copyWith(
                        //                     color: AppColors.c646982
                        //             )),
                        //             SpaceWidget(height: 20,),
                        //             Row(
                        //               children: [
                        //                 Expanded(
                        //                   child: ElevatedButton(
                        //                       style: ElevatedButton.styleFrom(
                        //                         backgroundColor: AppColors.white,
                        //                         elevation: 0,
                        //                         shape: RoundedRectangleBorder(
                        //                           borderRadius: BorderRadius.circular(10),
                        //                         ),
                        //                       ),
                        //                       onPressed: (){
                        //                         Navigator.pop(context);
                        //                       },
                        //                       child: Text('Cancel',style: AppTextStyles.bold16(context).copyWith(
                        //                         color: AppColors.c32343E
                        //                       ),)),
                        //                 ),
                        //                 SpaceWidget(width: 10,),
                        //                 Expanded(
                        //                   child: ElevatedButton(
                        //                       style: ElevatedButton.styleFrom(
                        //                         backgroundColor: AppColors.primaryColor,
                        //                         elevation: 0,
                        //                         shape: RoundedRectangleBorder(
                        //                           borderRadius: BorderRadius.circular(10),
                        //                         ),
                        //                       ),
                        //                       onPressed: () async
                        //                       {
                        //                         await homeScreenCubit.deleteMealFun(mealId: meal.id!);
                        //                         homeScreenCubit.getAllMealsFun();
                        //                         Navigator.pop(context);
                        //                       },
                        //                       child: Text('Yes',style: AppTextStyles.bold18(context).copyWith(
                        //                           color: AppColors.white
                        //                       ),)),
                        //                 )
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       ),);
                        //     },
                        //     child: Container(
                        //       width: 30.w,
                        //       height: 30.h,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: AppColors.cF58D1D,
                        //       ),
                        //       child: Center(
                        //         child: Icon(
                        //           Icons.remove, color: AppColors.white,),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    SpaceWidget(height: 15,),

                  ],
                ),
              ),


            ],
          ),
        );
      },
    );
  }
}
