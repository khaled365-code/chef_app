import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/commons/global_cubits/internet_checking_cubit.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/presentation/cubits/get_system_meals_cubit/system_meals_cubit.dart';
import 'package:chef_app/features/home/presentation/cubits/home_lists_cubit/home_lists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/services/internet_connection_service.dart';
import '../../../profile/presentation/views/custom_drawer_screen.dart';
import '../widgets/home/all_categories_row.dart';
import '../widgets/home/all_meals_row.dart';
import '../widgets/home/carousel_slider_widget.dart';
import '../widgets/home/categories_list_view.dart';
import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_meal_container.dart';
import '../widgets/home/home_no_meals_yet_widget.dart';
import '../widgets/home/sliver_list_loading_meals.dart';
import '../widgets/home/welcome_text_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
      {
        return Scaffold(
                backgroundColor: AppColors.white,
                drawer: CustomDrawerScreen(),
                body: SafeArea(
                    child: RefreshIndicator(
                  onRefresh: () async
                  {
                    if (await InternetConnectionCheckingService.checkInternetConnection() == true)
                    {
                      await SystemMealsCubit.get(context).getAllMealsFromApiFun();
                      buildScaffoldMessenger(context: context, msg: 'Meals fetched successfully',iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),snackBarBehavior: SnackBarBehavior.floating);

                    }
                    else
                      {
                        buildScaffoldMessenger(context: context, msg: 'You are offline',iconWidget: Icon(Icons.wifi_off,color: AppColors.white,),snackBarBehavior: SnackBarBehavior.floating);
                      }
                  },
                  edgeOffset: 1,
                  color: AppColors.primaryColor,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceWidget(
                              height: 32,
                            ),
                            HomeAppBar(),
                            SpaceWidget(
                              height: 24,
                            ),
                            WelcomeTextWidget(),
                            SpaceWidget(
                              height: 16,
                            ),
                            CarouselSliderWidget(),
                            SpaceWidget(
                              height: 32,
                            ),
                            AllCategoriesRow(),
                            SpaceWidget(
                              height: 20,
                            ),
                            BlocBuilder<HomeListsCubit, HomeListsState>(
                                builder: (context, state) {
                              return CategoriesListView();
                            }),
                            SpaceWidget(
                              height: 32,
                            ),
                            AllMealsRowWidget(),
                            SpaceWidget(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<SystemMealsCubit, SystemMealsState>(
                          builder: (context, state) {
                        if (state is GetAllMealsLoadingState)
                        {
                          return SliverListLoadingMeals();
                        }
                        if (state is GetAllMealsSuccessState &&
                            SystemMealsCubit.get(context).allMealsModel?.meals != null)
                        {

                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => GestureDetector(
                                onTap: () {
                                  navigate(
                                      context: context,
                                      route: Routes.mealDetailsScreen,
                                      arg: SystemMealsCubit.get(context)
                                          .allMealsModel
                                          ?.meals![index]);
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 24.w, end: 24.w, bottom: 28.h),
                                  child: HomeMealContainer(
                                    meal: SystemMealsCubit.get(context)
                                        .allMealsModel!
                                        .meals![index],
                                  ),
                                ),
                              ),
                              childCount: SystemMealsCubit.get(context)
                                  .allMealsModel!
                                  .meals!
                                  .length,
                            ),
                          );

                        } else if (state is GetCachedMealsSuccessState &&
                            SystemMealsCubit.get(context).cachedSystemMeals != null)
                        {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => GestureDetector(
                                onTap: () {
                                  navigate(
                                      context: context,
                                      route: Routes.mealDetailsScreen,
                                      arg: SystemMealsCubit.get(context)
                                          .cachedSystemMeals![index]);
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 24.w, end: 24.w, bottom: 28.h),
                                  child: HomeMealContainer(
                                    meal: SystemMealsCubit.get(context)
                                        .cachedSystemMeals![index],
                                  ),
                                ),
                              ),
                              childCount: SystemMealsCubit.get(context)
                                  .cachedSystemMeals!
                                  .length,
                            ),
                          );

                        } else if (state is GetCachedMealsFailureState)
                        {
                          return SliverToBoxAdapter(
                              child: HomeNoMealsYetWidget());
                        }
                        else if(state is GetAllMealsSuccessState &&
                            SystemMealsCubit.get(context).allMealsModel?.meals == null)
                          {
                            return SliverToBoxAdapter(
                                child: HomeNoMealsYetWidget());
                          }
                        else
                        {
                          return SliverListLoadingMeals();
                        }
                      }),
                      SliverToBoxAdapter(
                          child: SpaceWidget(
                        height: 32,
                      ))
                    ],
                  ),
                )),
              );
      }

  }

}






