import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../profile/presentation/views/custom_drawer_screen.dart';
import '../widgets/home/all_categories_row.dart';
import '../widgets/home/all_meals_row.dart';
import '../widgets/home/carousel_slider_widget.dart';
import '../widgets/home/categories_list_view.dart';
import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_meal_container.dart';
import '../widgets/home/sliver_list_loading_meals.dart';
import '../widgets/home/welcome_text_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
      {
        return
          Scaffold(
            backgroundColor: AppColors.cF3F3F3,
                  drawer: CustomDrawerScreen(homeContext: context,),
                   body: SafeArea(
                       child: RefreshIndicator(
                         key: HomeScreenCubit.get(context).refreshIndicatorKey,
                         onRefresh: () async
                         {
                           HomeScreenCubit.get(context).getAllMealsFun();
                         },
                         edgeOffset: 1,
                         color: AppColors.primaryColor,
                         child: CustomScrollView(
                           slivers: [
                             SliverToBoxAdapter(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children:
                                  [
                                    SpaceWidget(height: 32,),
                                    HomeAppBar(),
                                    SpaceWidget(height: 24,),
                                    WelcomeTextWidget(),
                                    SpaceWidget(height: 16,),
                                    CarouselSliderWidget(),
                                    SpaceWidget(height: 32,),
                                    AllCategoriesRow(),
                                    SpaceWidget(height: 20,),
                                    BlocBuilder<HomeScreenCubit,HomeScreenState>(
                                        builder: (context,state)
                                    {
                                      return CategoriesListView();

                                    }),
                                    SpaceWidget(height: 32,),
                                    AllMealsRowWidget(),
                                    SpaceWidget(height: 20,),
                                  ],
                               ),
                             ),
                             BlocBuilder<HomeScreenCubit,HomeScreenState>(
                                 builder: (context,state){
                                   if(state is GetAllMealsLoadingState)
                                     {
                                       return SliverListLoadingMeals();
                                     }
                                    if(HomeScreenCubit.get(context).allMealsModel?.meals!=null)
                                     {
                                       return SliverList(
                                         delegate: SliverChildBuilderDelegate(
                                               (context, index) => GestureDetector(
                                             onTap: ()
                                             {
                                                navigate(context: context, route: Routes.mealDetailsScreen,arg: HomeScreenCubit.get(context).allMealsModel?.meals![index]);
                                             },
                                             child: Padding(
                                               padding:  EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 28.h),
                                               child: HomeMealContainer(
                                                 meal:HomeScreenCubit.get(context).allMealsModel!.meals![index],
                                               ),
                                             ),
                                           ),
                                           childCount: HomeScreenCubit.get(context).allMealsModel!.meals!.length,
                                         ),
                                       );
                                     }
                                   else if(HomeScreenCubit.get(context).allMealsModel?.meals==null)
                                     {
                                       return SliverToBoxAdapter(child: SizedBox.shrink());
                                     }
                                   else
                                     {
                                       return SliverToBoxAdapter(child: Center(child: Text('Error')));
                                     }
                                 }),
                             SliverToBoxAdapter(child: SpaceWidget(height: 32,))

                           ],
                         ),
                       )),
                 );
      }

  }

}






