


import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/get_all_meals_model.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/meals.dart';
import 'package:chef_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:hive/hive.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../models/add_meal_model/add_meal_model.dart';
import '../models/chef_info_model/chef_info_model.dart';

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







  @override
  List<Meals> getCachedMeals() {
    // TODO: implement getCachedMeals
    throw UnimplementedError();
  }


  @override
  Future <Unit> saveCachedMeals({required List<Meals> mealList}) {
    // TODO: implement saveCachedMeals
    throw UnimplementedError();
  }


  // favourite meals:-

  @override
  Either<Exception,List<Meals>> getCachedFavouriteMeals()
  {
    var favouriteMealsBox=Hive.box<Meals>('favourite_meals');

    if(favouriteMealsBox.values.isNotEmpty)
    {
      return Right(favouriteMealsBox.values.toList());
    }
    else
    {
      return Left(Exception('No Data Found'));
    }
  }

  @override
  Future <Unit> saveCachedFavouriteMeals({required Meals meal}) async
  {
    var favouriteMealsBox=Hive.box<Meals>('favourite_meals');
    await  favouriteMealsBox.add(meal);
    return Future.value(unit);

  }



  // history meals:-

  @override
  Either<Exception,List<Meals>> getCachedHistoryMeals()
  {
    var historyMealsBox=Hive.box<Meals>('history_meals');
    if(historyMealsBox.values.isNotEmpty)
      {
        return Right(historyMealsBox.values.toList());
      }
    else
      {
        return Left(Exception('No Data Found'));
      }

  }



  @override
  Future <Unit> saveCachedHistoryMeals({required Meals meal}) async
  {
    var historyMealsBox=Hive.box<Meals>('history_meals');
    await historyMealsBox.add(meal);
    return Future.value(unit);
  }

  @override
  Future<Unit> removeOngoingFavouriteMeal({required int index})  async
  {
    var favouriteMealsBox=Hive.box<Meals>('favourite_meals');
    await favouriteMealsBox.deleteAt(index);
    return Future.value(unit);
  }

  @override
  Future<Either<ErrorModel, ChefInfoModel>> getChefData({required String chefIId}) async
  {
    try
    {
      final response=await api.get(EndPoints.getChefDataEndPoint(chefIId: chefIId));
      ChefInfoModel chefInfoModel=ChefInfoModel.fromJson(response);
      await Future.wait([
        CacheHelper().saveData(key: ApiKeys.profilePic, value: chefInfoModel.chef!.profilePic),
        CacheHelper().saveData(key: ApiKeys.phone, value: chefInfoModel.chef!.phone),
        CacheHelper().saveData(key: ApiKeys.brandName, value: chefInfoModel.chef!.brandName),
        CacheHelper().saveData(key: ApiKeys.minCharge, value: chefInfoModel.chef!.minCharge),
        CacheHelper().saveData(key: ApiKeys.description, value: chefInfoModel.chef!.disc),
        CacheHelper().saveData(key: ApiKeys.healthCertificate, value: chefInfoModel.chef!.healthCertificate,),
      ]);

      return Right(chefInfoModel);
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }



}