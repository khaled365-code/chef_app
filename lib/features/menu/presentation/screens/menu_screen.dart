import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/custom_progress_indicator.dart';
import 'package:chef_app/core/widgets/food_container.dart';
import 'package:chef_app/core/widgets/no_meals_widget.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:chef_app/features/menu/presentation/viewmodels/cubits/delete_meal_cubit/delete_meal_cubit.dart';
import 'package:chef_app/features/menu/presentation/viewmodels/cubits/menue_cubit/menue_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/views/screens/home_screen.dart';

class MenueScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          MenueCubit(menueRepoImplementation: MenueRepoImplementation(
              api: DioConsumer(dio: Dio())))
            ..getAllMeals(),
        ),
        BlocProvider(
          create: (context) => DeleteMealCubit(menueRepoImplementation: MenueRepoImplementation(api: DioConsumer(dio: Dio()))),
        ),

      ],
      child: BlocConsumer<MenueCubit, MenueState>(
        listener: (context, state)
        {
          if(state is DeleteMealSuccessState)
            {
              showToast(msg: S.of(context).mealDeletedSucessfully, toastStates: ToastStates.success);
            }
          else if(state is DeleteMealFailureState)
          {
            showToast(msg: S.of(context).mealNotDeletedSucessfully, toastStates: ToastStates.error);
          }

        },
        builder: (context, state) {
          final mealsCubit = BlocProvider.of<MenueCubit>(context);
          final deleteMealCubit = BlocProvider.of<DeleteMealCubit>(context);

          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.grey2,
              body: CustomScrollView(
                shrinkWrap: true,
                slivers:
                [
                  SliverToBoxAdapter(child: Padding(
                    padding: const EdgeInsets.only(top: 35, left: 15),
                    child: Center(
                      child: Text(
                        'Found ${mealsCubit.meals!.length} results',
                        style: AppTextStyles.font32.copyWith(
                            color: AppColors.black),
                      ),
                    ),
                  )),
                  SliverToBoxAdapter(child: SizedBox(height: 80)),
                  state is MenueMealsGetSuccessfullyState ?
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: mealsCubit.meals!.length,
                          (context, index) =>
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: FoodContainer(
                              meals: mealsCubit.meals![index],
                              width: 158,
                              textLeft: 50,
                              textBottom: 35,
                              imageTop: -30,
                              imageLeft: 40,
                              deleteOnTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      CustomAlertDialog(
                                        subTitle: S.of(context).deleteMealSure,
                                        confirmPressed: ()
                                        {
                                          deleteMealCubit.deleteMeal(mealsCubit.meals![index].id);
                                          mealsCubit.getAllMeals();
                                          Navigator.pop(context);
                                        },
                                      ),
                                );
                              },
                              updateMealOnTap: ()
                              {

                              },
                              updateMealRightPos: 30,
                            ),
                          ),
                    ),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 5,
                    ),
                  )
                      :
                  SliverToBoxAdapter(child: NoMealsYet()),
                  const SliverToBoxAdapter(child: SizedBox(height: 30,),)

                ],
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10,),
                child: GestureDetector(onTap: () {
                  navigate(context: context, route: Routes.addMealScreen);
                },
                    child: CircleAvatar(backgroundColor: AppColors.orange,
                        radius: 30,
                        child: Icon(Icons.add, color: AppColors.white,))),
              ),

            ),
          );
        },
      ),
    );
  }
}

