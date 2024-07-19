import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/grid_meal_item.dart';
import '../widgets/grid_shimmer_meal_item.dart';

class AllMealsScreen extends StatelessWidget {
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.cFEFEFE,
          body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
                  SliverToBoxAdapter(
                    child: Padding(
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
                          Spacer(),
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 24.w),
                            child: GestureDetector(
                              onTap: ()
                              {
                               navigate(context: context, route: Routes.addMealScreen);
                              },
                              child: Container(
                                width: 45.w,
                                height: 49.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.c181C2E
                                ),
                                child: Center(child: Icon(
                                  Icons.add, color: AppColors.white,)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 24.w),
                      child: Text('All Available Meals',
                          style: AppTextStyles.regular20(context).copyWith(
                              color: AppColors.c32343E
                          )),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
                  state is GetAllMealsLoadingState?
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
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return GridShimmerMealItem();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):
                  state is GetAllMealsSuccessState?
                      state.getAllMealsModel.meals!.isNotEmpty?
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
                              itemCount: state.getAllMealsModel.meals!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: ()
                                  {
                                     navigate(context: context, route: Routes.mealDetailsScreen,arg: state.getAllMealsModel.meals![index]);
                                  },
                                  child: GridMealItem(
                                    meal: state.getAllMealsModel.meals![index],
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
