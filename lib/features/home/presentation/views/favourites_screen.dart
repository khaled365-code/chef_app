
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../widgets/favourites/favourite_meal_widget.dart';



class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _buildAppBar(context),
        body: TabBarView(
            children:
            [
              ListView(
                  children: [
                    SpaceWidget(height: 32,),
                    BlocBuilder<HomeScreenCubit, HomeScreenState>(
                      builder: (context, state) {
                        if( state is GetCachedFavouriteMealsSuccessState)
                        {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                            itemBuilder:  (context, index) => FavouriteMealWidget(
                              index: index,
                              ongoingMeal: true,
                              meal: HomeScreenCubit.get(context).favouriteMealsList[index],
                            ),
                            separatorBuilder: (context, index) => SpaceWidget(height: 24,),
                            itemCount: HomeScreenCubit.get(context).favouriteMealsList.length,
                          );
                        }
                         if(state is GetCachedFavouriteMealsFailureState)
                        {
                          return SizedBox.shrink();
                        }
                        else
                        {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                              itemBuilder:  (context, index) => FavouriteMealWidget(
                                index: index,
                                ongoingMeal: true,
                                meal: HomeScreenCubit.get(context).favouriteMealsList[index],
                              ),
                              separatorBuilder: (context, index) => SpaceWidget(height: 24,),
                              itemCount: HomeScreenCubit.get(context).favouriteMealsList.length,
                            );
                        }
                      },
                    ),
                    SpaceWidget(height: 67,),
                  ],
                ),
              ListView(
                children: [
                  SpaceWidget(height: 32,),
                  BlocBuilder<HomeScreenCubit, HomeScreenState>(
                  builder: (context, state) {
                   if(HomeScreenCubit.get(context).historyMealsList.isNotEmpty)
                     {
                       return ListView.separated(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                         itemBuilder:  (context, index) => FavouriteMealWidget(
                           index: index,
                           ongoingMeal: false,
                           meal: HomeScreenCubit.get(context).historyMealsList[index],
                         ),
                         separatorBuilder: (context, index) => SpaceWidget(height: 24,),
                         itemCount: HomeScreenCubit.get(context).historyMealsList.length,
                       );
                     }
                   if(HomeScreenCubit.get(context).historyMealsList.isEmpty )
                   {
                     return SizedBox.shrink();
                   }
                   else
                   {
                       return Center(
                           child: Container(
                             width: 30.w,
                             height: 30.h,
                             child: CircularProgressIndicator(
                               color: AppColors.primaryColor,
                             ),
                           ),);

                   }
                   },
                  ),
                  SpaceWidget(height: 67,),

                ],
              ),
            ]),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        leading: Padding(
          padding:  EdgeInsetsDirectional.only(start: 10.w),
          child: GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cECF0F4
              ),
              child: Center(child: SvgPicture.asset(
                ImageConstants.arrowBackIcon,width: 10,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),)),
            ),
          ),
        ),
        title: Text('My Favourites',style: AppTextStyles.regular17(context).copyWith(
            color: AppColors.c181C2E
        ),),
        bottom: TabBar(
          onTap: (index)
          {
            if(index==1)
              {
                HomeScreenCubit.get(context).getCachedHistoryMeals();

              }
            },
          unselectedLabelStyle: AppTextStyles.regular14(context).copyWith(
            color: AppColors.cA5A7B9
          ),
          labelStyle: AppTextStyles.bold14(context).copyWith(
            color: AppColors.cFB6D3A
          ),
            indicatorColor: AppColors.cFF7622,
             indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsetsDirectional.only(start: 24.w,),
            dividerColor: AppColors.cCED7DF,
            tabs:
            [
              Tab(
                child: Text('Ongoing',),
              ),
              Tab(
                child: Text('History',),
              )
            ]),
      );
  }




}



