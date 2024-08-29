

import 'dart:io';

import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/get_all_meals_model.dart';
import 'package:chef_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:image_picker/image_picker.dart';

import '../models/add_meal_model/add_meal_model.dart';

class HomeRepoImplementation implements HomeRepo
{


  final ApiConsumer api;

  HomeRepoImplementation({required this.api});
  @override
  Future<Either<ErrorModel,GetAllMealsModel>> getAllMeals() async
  {
    try{
      final response=await api.get(EndPoints.getAllChefsMealsEndPoint);
      GetAllMealsModel getAllMealsModel=GetAllMealsModel.fromJson(response);
      return Right(getAllMealsModel);
    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }


  }

  @override
  Future<Either<ErrorModel, AddMealModel>> addNewMeal(
      {required String name,
        required String description,
        required double price,
        required String category,
        required MultipartFile image,
        required String howToSell}) async
  {

    try
    {
     final response=await api.post(EndPoints.addNewMealEndPoint,data: {
       ApiKeys.name:name,
       ApiKeys.description:description,
       ApiKeys.price:price,
       ApiKeys.category:category,
       ApiKeys.mealImages:image,
       ApiKeys.howToSell:howToSell
     },formData: true);
     AddMealModel addMealModel=AddMealModel.fromJson(response);
     return Right(addMealModel);
    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> updateMeal({required String mealId, String? name, String? description, double? price, String? category,required MultipartFile mealImage}) async
  {
    try
    {
          final response=await api.patch(EndPoints.updateMealEndPoint(mealId: mealId,),
              data:
              {
                ApiKeys.name:name,
                ApiKeys.description:description,
                ApiKeys.price:price,
                ApiKeys.category:category,
                ApiKeys.mealImages:mealImage
              },formData: true
          );
          return Right(response[ApiKeys.message]);
        }
    on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

}