




import 'dart:io';

import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/global_cubits/get_chef_meals_cubit/get_chef_meals_cubit.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/custom_nav_bar.dart';
import 'package:chef_app/core/widgets/outlined_text_field.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:chef_app/features/home/presentation/viewmodels/delete_account_cubit/delete_account_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global_models/food_categories_model/FoodCategoriesModel.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/rectangle_food_container.dart';
import '../../../../../core/widgets/rhombic_container.dart';
import '../../../../../generated/l10n.dart';
import '../components/home_drawer_body.dart';
import '../components/home_drawer_header.dart';

class HomeScreen extends StatefulWidget {



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState()
  {
    super.initState();
    BlocProvider.of<GetChefMealsCubit>(context).getChefMeals();
  }
  List<FoodCategoriesModel> foodCategories=
  [
    FoodCategoriesModel(image: AppAssets.mexican,name: 'Burger'),
    FoodCategoriesModel(image: AppAssets.donat,name: 'Donat'),
    FoodCategoriesModel(image: AppAssets.pizza,name: 'Pizza'),
    FoodCategoriesModel(image: AppAssets.mexican,name: 'Mexican'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Asian'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Rice'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Vegetar.'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Vegan'),
    FoodCategoriesModel(image: AppAssets.mexican,name: 'Morning'),
    FoodCategoriesModel(image: AppAssets.pizza,name: 'Lunch'),
    FoodCategoriesModel(image: AppAssets.mexican,name: 'Dinner'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Dairy'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Salads'),
    FoodCategoriesModel(image: AppAssets.mexican,name: 'Sammie'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Snacks'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Dessert'),
    FoodCategoriesModel(image: AppAssets.Asian,name: 'Meat'),


  ];


  int nowIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey2,
        appBar: AppBar(
          backgroundColor: AppColors.grey2,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Builder(
              builder: (context) {
                return GestureDetector(child: Image.asset(AppAssets.lines3),onTap: (){
                  Scaffold.of(context).openDrawer();
                }, );
              }
            ),
          ),
          actions:
          [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(onTap: (){
                navigate(context: context, route: Routes.updateProfileScreen);
              },child: CircleAvatar(backgroundImage: AssetImage(AppAssets.khaled,),radius: 20,))
            ),
          ],
        ),
         body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                SizedBox(height: 5,),
                Text(S.of(context).delicious,style: AppTextStyles.font32.copyWith(color: AppColors.black),),
                Text(S.of(context).foodforyou,style: AppTextStyles.font32.copyWith(color: AppColors.black)),
                SizedBox(height: 20,),
                // search Widget
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: double.infinity,
                    height: 51,
                    child: Row(
                      children:
                      [
                        Expanded(
                          child: OutlinedTextField(
                            textInputType: TextInputType.text,
                            hintText: S.of(context).search,
                            controller: TextEditingController(),
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return S.of(context).please_enter_name;
                              }
                              return null;
                            },
                            suffixIcon: Icons.search,
                            fillColor: AppColors.white,
                            borderRadiusValue: 10,
                            top: 35,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                            width: 51,
                            height: 51,
                            color: AppColors.grey2,
                            child: Image.asset(AppAssets.control2))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                // rhombic container
                Container(
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => RhombicContainer(
                          foodCategoriesModel: foodCategories[index],
                        ),
                        separatorBuilder: (context, index) =>SizedBox(width: 15,),
                        itemCount: foodCategories.length),
                  ),
                ),
                // featured row
                Padding(
                  padding: const EdgeInsets.only(top: 35,right: 15),
                  child: Row(
                    children: [
                      Text('Featured Meals',style: AppTextStyles.font16.copyWith(color: AppColors.black),),
                      Spacer(),
                      Text('View All',style: AppTextStyles.font14.copyWith(color: AppColors.primary),),
                      Icon(Icons.navigate_next,color: AppColors.primary,)


                    ],
                  ),
                ),
                SizedBox(height: 15,),
                // rectangle container
                Container(
                  height: 229,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => RectangleFoodContainer(
                          meals: BlocProvider.of<GetChefMealsCubit>(context).meals![index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(width: 15,),
                        itemCount: BlocProvider.of<GetChefMealsCubit>(context).meals!.length),
                  ),
                ),


              ],
            ),
          ),
        ),

        drawer: Container(
          child: Column(
            children:
            [
              HomeDrawerHeader(),
              HomeDrawerBody()

            ],
          ),
        ),

        bottomNavigationBar: CustomNavBar(
          iconn1: Icons.home,
          iconn2: Icons.add_location,
          iconn3: Icons.notifications,
          iconn4: Icons.person_4,
          iconn5: Icons.restaurant,
          nowIndex: nowIndex,

          onPressed1: ()
          {
            setState(() {
              nowIndex=0;
            });
            navigate(context: context, route: Routes.homeScreen);
          },
          onPressed2: ()
          {
            setState(() {
              nowIndex=1;
            });
          },
          onPressed3: ()
          {
            setState(() {
              nowIndex=2;
            });
          },
          onPressed4: ()
          {
            setState(() {
              nowIndex=3;
            });
            navigate(context: context, route: Routes.updateProfileScreen);

          },
          onPressed5: ()
          {
            setState(() {
              nowIndex=4;
            });
            navigate(context: context, route: Routes.menuScreen);

          },

        ),

      );
  }
}




