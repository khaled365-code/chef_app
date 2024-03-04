


import 'package:chef_app/features/menu/data/models/MealModel.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class MenueRepo
{

  Future<Either<String,String>> addMeal({required String name,required String desc,required String price,required String category,required String howToSell,required XFile mealImage});
  Future<Either<String,MealModel>> getAllMeals({required dynamic id});
  Future<Either<String,String>> deleteMeals({required dynamic id});

}