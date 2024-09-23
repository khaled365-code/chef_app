


import 'dart:developer';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/core/utilis/services/local_notifications_service.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/get_all_meals_model.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/system_all_meals.dart';
import 'package:chef_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:hive/hive.dart';
import '../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../models/add_meal_model/add_meal_model.dart';
import '../models/chef_info_model/chef_info_model.dart';

class HomeRepoImplementation implements HomeRepo
{


  final ApiConsumer api;

  HomeRepoImplementation({required this.api});

  var cachedSystemMeals=Hive.box<SystemMeals>('cached_system_meals');

  @override
  Either<Exception,List<SystemMeals>> getCachedMeals()
  {
    log('Meals are from cache');

    if(cachedSystemMeals.values.isNotEmpty)
    {
      return Right(cachedSystemMeals.values.toList());
    }
    else
    {
      return Left(Exception('No Cached Meals Found'));
    }

  }

  @override
  Future<Either<ErrorModel,GetAllMealsModel>> getAllMeals() async
  {
    try
    {
      final response=await api.get(EndPoints.getAllChefsMealsEndPoint);
      GetAllMealsModel getAllMealsModel=GetAllMealsModel.fromJson(response);
      if(getAllMealsModel.meals!.isNotEmpty)
        {
          await cachedSystemMeals.clear();
          for (var meal in getAllMealsModel.meals!)
            {
              await cachedSystemMeals.add(meal);

            }
        }
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















  // favourite meals:-

  var favouriteMealsBox=Hive.box<SystemMeals>('favourite_meals');
  @override
  Either<Exception,List<SystemMeals>> getCachedFavouriteMeals()
  {
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
  Future <Unit> saveFavouriteMealToCache({required SystemMeals meal}) async
  {
    if(favouriteMealsBox.values.contains(meal))
      {
        return Future.value(unit);
      }
    await  favouriteMealsBox.add(meal);
    return Future.value(unit);

  }

  @override
  Future<Unit> removeOngoingFavouriteMeal({required int index})  async
  {
    await favouriteMealsBox.deleteAt(index);
    return Future.value(unit);
  }



  // history meals:-

  var historyMealsBox=Hive.box<SystemMeals>('history_meals');

  @override
  Either<Exception,List<SystemMeals>> getCachedHistoryMeals()
  {
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
  Future <Unit> saveCachedHistoryMeals({required SystemMeals meal}) async
  {
    if(historyMealsBox.values.contains(meal))
      {
        return Future.value(unit);
      }
    await historyMealsBox.add(meal);
    return Future.value(unit);
  }




  // local Notifications :-
  var notificationBox=Hive.box<LocalNotificationsModel>('cached_local_notifications');

  @override
  Either<Exception, List<LocalNotificationsModel>> getCachedLocalNotifications()
  {
    if(notificationBox.values.isNotEmpty)
      {
        return Right(notificationBox.values.toList());
      }
    else
      {
        return Left(Exception('No Notifications Found'));
      }

  }

  @override
  Future<Unit> saveLocalNotification({required LocalNotificationsModel localNotification}) async
  {
    await notificationBox.add(localNotification);
    return Future.value(unit);
  }

  @override
  Future<Unit> clearAllNotifications() async
  {
    await notificationBox.clear();
    await LocalNotificationsService.cancelAllNotifications();
    return Future.value(unit);

  }

  @override
  Future<Unit> deleteNotification({required  int localNotificationId,required int index}) async
  {
     await notificationBox.deleteAt(index);
     await LocalNotificationsService.cancelSpecificNotification(id: localNotificationId);
    return Future.value(unit);

  }






}