import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:chef_app/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../widgets/carousel_container_item.dart';
import '../widgets/home_meal_container.dart';
import '../widgets/home_shimmer_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        var homeScreenCubit = BlocProvider.of<HomeScreenCubit>(context);
        return Scaffold(
          body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SpaceWidget(height: 24,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 24.w),
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.cECF0F4
                            ),
                            child: Center(child: SvgPicture.asset(
                                ImageConstants.menuIcon)),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 24.w),
                            child: GestureDetector(
                               onTap: ()
                              {
                                Navigator.pushNamed(context, Routes.allMealsScreen);
                              },
                              child: Container(
                                width: 45.w,
                                height: 49.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.c181C2E
                                ),
                                child: Center(child: SvgPicture.asset(
                                    ImageConstants.cartIcon,colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),)),
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
                      child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hey ${CacheHelper().getData(
                                      key: ApiKeys.name)},',
                                  style: AppTextStyles.regular16(context)
                                      .copyWith(color: AppColors.c1E1D1D),
                                ),
                                TextSpan(
                                  text: ' ${getCurrentTime()}!',
                                  style: AppTextStyles.bold16(context).copyWith(
                                      color: AppColors.c1E1D1D),
                                )
                              ]
                          )),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 16,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 15.w),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          scrollDirection: Axis.horizontal,
                          aspectRatio: 327 / 295,
                          enableInfiniteScroll: true,
                          clipBehavior: Clip.none,
                          viewportFraction: 1,
                          initialPage: 0,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayCurve: Curves.easeIn,
                        ),
                        items: [1, 2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CarouselContainerItem(
                                carouselSliderModel: homeScreenCubit.carouselSliderList[i - 1],
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 32,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 24.w, end: 24.w),
                      child: Row(
                        children: [
                          Text('All Categories', style: AppTextStyles.regular17(
                              context).copyWith(color: AppColors.c32343E),),
                          Spacer(),
                          Text('See All', style: AppTextStyles.regular16(
                              context).copyWith(color: AppColors.c333333),),
                          SpaceWidget(width: 10,),
                          SvgPicture.asset(ImageConstants.seeAllNextIcon)
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 20,)),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 80.h,
                      child: ListView.builder(
                        padding: EdgeInsetsDirectional.only(start: 15.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenCubit.allCategoriesList.length,
                         itemBuilder:(context, index) => GestureDetector(
                           onTap: ()
                           {
                             homeScreenCubit.changeCurrentSelectedCategoryPosition(index: index);
                           },
                           child: Padding(
                            padding: EdgeInsetsDirectional.only(end: index!=homeScreenCubit.allCategoriesList.length-1? 7.w:0),
                            child: CategoryItem(
                              isItemSelected: index==homeScreenCubit.currentSelectedCategoryIndex,
                                allCategoriesModel: homeScreenCubit.allCategoriesList[index]),
                           ),
                         ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 32,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 24.w, end: 24.w),
                      child: Row(
                        children: [
                          Text('All Meals', style: AppTextStyles.regular17(
                              context).copyWith(color: AppColors.c32343E),),
                          Spacer(),
                          Text('See All', style: AppTextStyles.regular16(
                              context).copyWith(color: AppColors.c333333),),
                          SpaceWidget(width: 10,),
                          SvgPicture.asset(ImageConstants.seeAllNextIcon)
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SpaceWidget(height: 20,)),
                  state is GetAllMealsLoadingState?
                  SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 24.w, end: 24.w, bottom: 28.h),
                                    child: HomeShimmerContainer(),
                                  ),
                              childCount: 10))
                      :
                  state is GetAllMealsSuccessState?
                      state.getAllMealsModel.meals!.isNotEmpty?
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                          onTap: ()
                          {
                            navigate(context: context, route: Routes.mealDetailsScreen,arg: state.getAllMealsModel.meals![index]);
                          },
                          child: Padding(
                            padding:  EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 28.h),
                            child: HomeMealContainer(
                             meal:state.getAllMealsModel.meals![index] ,
                            ),
                          ),
                        ),
                        childCount: state.getAllMealsModel.meals!.length,
                      ),
                  ):SliverToBoxAdapter(child: SizedBox.shrink()):SliverToBoxAdapter(child: Text('Error'),),
                              SliverToBoxAdapter(child: SpaceWidget(height: 32,)),






                ],
              )),
        );
      },
    );
  },
);
  }

  getCurrentTime() {
    if (DateTime
        .now()
        .hour < 12) {
      return 'Good Morning';
    }
    else if (DateTime
        .now()
        .hour < 17) {
      return 'Good Afternoon';
    }
    else {
      return 'Good Evening';
    }
  }
}
