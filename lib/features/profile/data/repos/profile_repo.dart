
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../models/specific_chef_meals_model/chef_meals_model.dart';

abstract class ProfileRepo
{



 Future<Either<ErrorModel,SpecificChefMealsModel>>getChefMeals({required String chefIId});

 Future<Either<ErrorModel,String>>deleteMyAccount({required String chefId});

 Future<Either<ErrorModel,String>>logOut();

 Future<Either<ErrorModel,String>>changePasswordForAccount({required String oldPassword,required String newPassword,required String confirmPassword});

 Future<Either<ErrorModel,String>> updateProfile(
     {  String? name,  String? phone,
       String? brandName,  double? minCharge,
       String? disc,  MultipartFile? profilePic});







}