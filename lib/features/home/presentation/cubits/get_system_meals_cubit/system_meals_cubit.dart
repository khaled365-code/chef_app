import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/services/internet_connection_service.dart';
import '../../../data/models/all_categories_model/all_categories_model.dart';
import '../../../data/models/carousel_slider_data_model/carousel_slider_model.dart';
import '../../../data/models/get_meals_model/get_all_meals_model.dart';
import '../../../data/models/get_meals_model/system_meals.dart';

part 'system_meals_state.dart';

class SystemMealsCubit extends Cubit<SystemMealsState> {
  SystemMealsCubit({required this.homeRepoImplementation}) : super(SystemMealsInitial());

  final HomeRepoImplementation homeRepoImplementation;



  static SystemMealsCubit get(context)=> BlocProvider.of(context);




  GetAllMealsModel? allMealsModel;
  List<SystemMeals>? cachedSystemMeals;
  Future<void> getAllMealsFromApiFun() async
  {
      emit(GetAllMealsLoadingState());
      log('meals from api');
      final response=await homeRepoImplementation.getAllMeals();
      emit(getStateAfterRequest(response));

  }

  void getMealsFromCacheFun()
  {
     final data= homeRepoImplementation.getCachedMeals();
    data.fold((exception)
    {
      emit(GetCachedMealsFailureState());

    }, (mealsList)
    {
      cachedSystemMeals=mealsList;
      emit(GetCachedMealsSuccessState());

    },);
  }

  SystemMealsState getStateAfterRequest(Either<ErrorModel, GetAllMealsModel> response)
  {
    return response.fold((errorModel)
    {
      return GetAllMealsFailureState(errorModel: errorModel);
    }, (getAllMealsModel)
    {
      allMealsModel=getAllMealsModel;
      return GetAllMealsSuccessState(getAllMealsModel: getAllMealsModel);
    });

  }







}
