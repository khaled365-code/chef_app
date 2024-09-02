

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../data/models/get_meals_model/meals.dart';

class FavouriteMealWidget extends StatelessWidget {
  const FavouriteMealWidget({super.key, required this.meal, required this.ongoingMeal,});

  final Meals meal;
  final bool ongoingMeal;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
         Text(meal.category!,style: AppTextStyles.regular14(context).copyWith(
           color: AppColors.c181C2E
         ),),
         SpaceWidget(height: 32,),
         Container(
           height: 60.h,
           child:  Row(
             children: [
               Container(
                 width: 60.w,
                 height: 60.h,
                 decoration: BoxDecoration(
                     color: AppColors.primaryColor,
                     borderRadius: BorderRadius.circular(8.r),
                     image: meal.images!.first.isNotEmpty?
                     DecorationImage(
                         image: CachedNetworkImageProvider(meal.images!.first),
                         fit: BoxFit.fill):null
                 ),
               ),
               SpaceWidget(width: 14,),
               Padding(
                 padding:  EdgeInsets.only(top: 8.h),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     Text(meal.name!,style: AppTextStyles.bold14(context).copyWith(
                         color: AppColors.c181C2E
                     ),),
                     SpaceWidget(height: 5.h,),
                     IntrinsicHeight(
                       child: Row(
                         children: [
                           Text('\$${meal.price}',style: AppTextStyles.bold14(context).copyWith(
                               color: AppColors.c181C2E
                           ),),
                           ongoingMeal==false?
                           Row(
                             children: [
                               SpaceWidget(width: 10,),
                               VerticalDivider(
                                 color: AppColors.cCACCDA,
                                 width: 16.w,
                                 thickness: 2,
                               ),
                               SpaceWidget(width: 14,),
                               RichText(
                                   text:
                               TextSpan(
                                   children: [
                                     TextSpan(text: '${formatDate(dateTime: DateTime.now(),monthName: true)},',style: AppTextStyles.regular14(context).copyWith(
                                         color: AppColors.c6B6E82
                                     )),
                                     TextSpan(text: ' ${formatClock(DateTime.now())}',style: AppTextStyles.regular14(context).copyWith(
                                         color: AppColors.c6B6E82
                                     )),
                                   ]
                               )),
                               SpaceWidget(width: 8),
                               Container(
                                 width: 4.w,
                                 height: 4.h,
                                 decoration: BoxDecoration(
                                     color: AppColors.c6B6E82,
                                     shape: BoxShape.circle
                                 ),
                               )
                             ],
                           ): SizedBox.shrink()
                         ],
                       ),
                     ),

                   ],
                 ),
               ),




             ],
           ),
         ),
          SpaceWidget(height: 24,),
          ongoingMeal==true?
          Row(
            children:
            [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(38.h),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)
                  )
                ),
                  onPressed: ()
                  {
                       HomeScreenCubit.get(context).addToHistoryFavouriteMeal(meal: meal);
                  },
                  child: Text('Add to history',style: AppTextStyles.bold12(context).copyWith(
                    color: AppColors.white
                  ),))),
              SpaceWidget(width: 49,),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(38.h),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(color: AppColors.primaryColor)
                          )
                      ),
                      onPressed: ()
                      {
                        HomeScreenCubit.get(context).removeOngoingFavouriteMeal(meal: meal);
                      },
                      child: Text('Remove',style: AppTextStyles.bold12(context).copyWith(
                          color: AppColors.cFF7622
                      ),)))

            ],
          ):
          SizedBox.shrink()
        ],
      ),
    );
  }
}
