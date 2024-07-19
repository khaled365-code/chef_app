

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../data/models/get_meals_model/meals.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var receivedMeal=ModalRoute.of(context)!.settings.arguments as Meals;
    return Scaffold(

      body: SafeArea(
          child: CustomScrollView(
            slivers:
            [
              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.cECF0F4
                          ),
                          child: Center(child: SvgPicture.asset(
                              ImageConstants.arrowBackIcon)),
                        ),
                      ),
                      SpaceWidget(width: 16,),
                      Text('Details',style: AppTextStyles.regular17(context).copyWith(
                        color: AppColors.c181C2E
                      ))
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SpaceWidget(height: 44,)),
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24),
                  child: AspectRatio(
                      aspectRatio: 327/184,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                         image: receivedMeal.images!.isEmpty? null:
                         DecorationImage(
                             image: CachedNetworkImageProvider(
                                 receivedMeal.images!.first
                             ),fit: BoxFit.fill)
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsetsDirectional.only(start: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(receivedMeal.name!,style: AppTextStyles.regular20(context).copyWith(
                          color: AppColors.c181C2E
                      ),),
                      SpaceWidget(height: 5,),
                      Text(receivedMeal.description!,style: AppTextStyles.regular14(context).copyWith(
                          color: AppColors.cA0A5BA
                      ),),
                      SpaceWidget(height: 14,),
                      Row(
                        children: [
                          SvgPicture.asset(ImageConstants.priceIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
                          SpaceWidget(width: 4,),
                          Text(receivedMeal.price.toString(),style: AppTextStyles.bold16(context).copyWith(
                              color: AppColors.c181C2E
                          ),),
                          SpaceWidget(width: 24,),
                          SvgPicture.asset(ImageConstants.categoryIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
                          SpaceWidget(width: 4,),
                          Text(receivedMeal.category!,style: AppTextStyles.regular14(context).copyWith(
                              color: AppColors.c181C2E
                          ),),
                          SpaceWidget(width: 24,),
                          SvgPicture.asset(ImageConstants.userChefIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
                          SpaceWidget(width: 4,),
                          Text(receivedMeal.chefId!.brandName!,style: AppTextStyles.regular14(context).copyWith(
                              color: AppColors.c181C2E
                          ),),
                        ],
                      ),
                      SpaceWidget(height: 26.2,),
                      Row(
                        children: [
                          SvgPicture.asset(ImageConstants.timeIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
                          SpaceWidget(width: 5,),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'created at:',
                                      style: AppTextStyles.regular13(context)
                                          .copyWith(color: AppColors.c32343E),
                                    ),
                                    TextSpan(
                                      text: ' ${formatDate(DateTime.parse(receivedMeal.createdAt!))}',
                                      style: AppTextStyles.regular16(context).copyWith(
                                          color: AppColors.c121223),
                                    ),
                                    TextSpan(
                                      text: ' at ${formatClock(DateTime.parse(receivedMeal.createdAt!))}',
                                      style: AppTextStyles.regular16(context).copyWith(
                                          color: AppColors.c121223),
                                    ),
                                    TextSpan(
                                      text: ' ${getAmorPm(DateTime.parse(receivedMeal.createdAt!))}',
                                      style: AppTextStyles.regular16(context).copyWith(
                                          color: AppColors.c121223),
                                    )
                                  ]
                              )),
                        ],
                      ),
                      SpaceWidget(height: 19.2,),
                      Row(
                        children: [
                          SvgPicture.asset(ImageConstants.timeIcon,colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
                          SpaceWidget(width: 5,),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'updated at:',
                                      style: AppTextStyles.regular13(context)
                                          .copyWith(color: AppColors.c32343E),
                                    ),
                                    TextSpan(
                                      text: ' ${formatDate(DateTime.parse(receivedMeal.updatedAt!))}',
                                      style: AppTextStyles.regular16(context).copyWith(
                                          color: AppColors.c121223),
                                    ),
                                    TextSpan(
                                      text: ' at ${formatClock(DateTime.parse(receivedMeal.updatedAt!))}',
                                      style: AppTextStyles.regular16(context).copyWith(
                                          color: AppColors.c121223),
                                    ),
                                    TextSpan(
                                      text: ' ${getAmorPm(DateTime.parse(receivedMeal.updatedAt!))}',
                                      style: AppTextStyles.regular16(context).copyWith(
                                          color: AppColors.c121223),
                                    )
                                  ]
                              )),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
              SliverFillRemaining(
                child: Container(
                  color: AppColors.cF0F5FA,
                  child: Column(
                    children: [
                      Spacer(),
                      SharedButton(btnText: 'Update This Meal',
                      onPressessed: ()
                        {
                           navigate(context: context, route: Routes.updateMealScreen,arg: receivedMeal);
                        },),
                      SpaceWidget(height: 30,)
                    ],
                  ),
                ),
              )



            ],
          )),
    );
  }
}
