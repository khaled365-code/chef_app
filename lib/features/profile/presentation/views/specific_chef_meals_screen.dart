import 'package:chef_app/features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import 'package:chef_app/features/profile/presentation/widgets/specific_chef_meals/grid_shimmer_chef_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/specific_chef_meals/grid_specific_chef_meal_item.dart';
import '../widgets/specific_chef_meals/specific_chef_meals_bar.dart';

class SpecificChefMealsScreen extends StatelessWidget {
  const SpecificChefMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF3F3F3,
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceWidget(height: 24,),
                      SpecificChefMealsAppBar(),
                      SpaceWidget(height: 24,),
                      BlocBuilder<GetSpecificChefMealsCubit,GetSpecificChefMealsState>(
                        builder: (context, state) {
                          return Center(
                            child: Text('Found ${GetSpecificChefMealsCubit
                                .get(context)
                                .chefMeals
                                ?.length ?? 0} results ',
                                style: AppTextStyles.bold28(context).copyWith(
                                    color: AppColors.c32343E
                                )),
                          );
                        },
                      ),
                      SpaceWidget(height: 70,),


                    ],
                  ),
                ),
              ),
              BlocBuilder<GetSpecificChefMealsCubit, GetSpecificChefMealsState>(
                builder: (context, state) {
                  if (state is GetSpecificChefMealsLoadingState)
                  {
                    return  SliverToBoxAdapter(
                      child: GridView.custom(
                        padding:  EdgeInsets.symmetric(horizontal: 24.w),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childrenDelegate: SliverChildBuilderDelegate(
                              (context, index) => GridShimmerChefMealItem(),
                          childCount: 10,
                        ),
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 70,
                          crossAxisSpacing: 30,
                          pattern: [
                            WovenGridTile(.67),
                            WovenGridTile(
                                220 / 252,
                                alignment: AlignmentDirectional.bottomCenter
                            ),
                          ],

                        ),
                      ),
                    );

                  }
                  else if (state is GetSpecificChefMealsSuccessState &&
                      GetSpecificChefMealsCubit.get(context).chefMeals!.isNotEmpty)
                  {

                    return  SliverToBoxAdapter(
                      child: GridView.custom(
                        padding:  EdgeInsets.symmetric(horizontal: 24.w),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => GridSpecificChefMealsItem(
                            meal: GetSpecificChefMealsCubit.get(context).chefMeals![index],
                          ),
                          childCount: GetSpecificChefMealsCubit.get(context).chefMeals!.length,
                        ),
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 70,
                          crossAxisSpacing: 30,
                          pattern: [
                            WovenGridTile(.67),
                            WovenGridTile(
                              220 / 252,
                              alignment: AlignmentDirectional.bottomCenter
                            ),
                          ],
                      
                        ),
                      ),
                    );

                  }
                  else if (GetSpecificChefMealsCubit.get(context).chefMeals!.isEmpty)
                  {
                    return SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    );
                  }
                  else
                  {
                    return SliverToBoxAdapter(
                      child: Text('Error'),
                    );
                  }
                },),
              SliverToBoxAdapter(child: SpaceWidget(height: 39,)),


            ],
          )),
    );
  }
}

