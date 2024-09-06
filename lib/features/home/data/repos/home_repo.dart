

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/database/errors/error_model.dart';
import '../models/add_meal_model/add_meal_model.dart';
import '../models/chef_info_model/chef_info_model.dart';
import '../models/get_meals_model/get_all_meals_model.dart';
import '../models/get_meals_model/meals.dart';

abstract class HomeRepo
{

  Future<Either<ErrorModel,ChefInfoModel>>getChefData({required String chefIId});

  Future<Either<ErrorModel,GetAllMealsModel>>getAllMeals();
  Future<Either<ErrorModel,AddMealModel>>addNewMeal({
    required String name,
    required String description,
    required double price,
    required String category,
    required MultipartFile image,
    required String howToSell,});

  Future<Either<ErrorModel, String>> updateMeal({
    required String mealId,
    required MultipartFile mealImage,
    String? name,
    String? description,
    double? price,
    String? category,
  });

  Future <Unit> saveCachedMeals({required List<Meals> mealList});

  Future <Unit> saveCachedHistoryMeals({required Meals meal});

  Future <Unit> saveCachedFavouriteMeals({required Meals meal});

  Future<Unit> removeOngoingFavouriteMeal({required int index});



  List<Meals> getCachedMeals();

  Either<Exception,List<Meals>> getCachedFavouriteMeals();


  Either<Exception,List<Meals>> getCachedHistoryMeals();










}