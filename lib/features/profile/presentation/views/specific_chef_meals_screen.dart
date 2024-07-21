


import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../home/presentation/widgets/grid_shimmer_meal_item.dart';
import '../widgets/grid_specific_chef_meal_item.dart';

class SpecificChefMealsScreen extends StatelessWidget {
  const SpecificChefMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSpecificChefMealsCubit, GetSpecificChefMealsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.cFEFEFE,
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceWidget(height: 24,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 24.w),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
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

                        ],
                      ),
                    ),
                    SpaceWidget(height: 24,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 24.w),
                      child: Text('All ${CacheHelper().getData(key: ApiKeys.name)} Meals',
                          style: AppTextStyles.regular20(context).copyWith(
                              color: AppColors.c32343E
                          )),
                    ),
                    SpaceWidget(height: 24,),

                  ],
                ),
              ),
              state is GetSpecificChefMealsLoadingState?
              SliverToBoxAdapter(
                child: Center(child: Lottie.asset(ImageConstants.foodLottie)),
              ):
              state is GetSpecificChefMealsSuccessState?
              state.specificChefMealsModel.meals!.isNotEmpty?
              SliverFillRemaining(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 21.h,
                          crossAxisSpacing: 21.w,
                          clipBehavior: Clip.none,
                          itemCount: state.specificChefMealsModel.meals!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: ()
                              {
                                // navigate(context: context, route: Routes.mealDetailsScreen,arg: state.specificChefMealsModel.meals![index]);
                              },
                              child: GridSpecificChefMealsItem(
                                meal: state.specificChefMealsModel.meals![index],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : SliverToBoxAdapter(child: SizedBox.shrink(),) :SliverToBoxAdapter(child: Text('Error'),),
              SliverToBoxAdapter(child: SpaceWidget(height: 32,)),


            ],
          )),
    );
  },
);
  }
}
