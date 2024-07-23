
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:dartz/dartz.dart';

import '../models/chef_info_model/chef_info_model.dart';
import '../models/specific_chef_meals_model/chef_meals_model.dart';

abstract class ProfileRepo
{


 Future<Either<ErrorModel,ChefInfoModel>>getChefData({required String chefIId});

 Future<Either<ErrorModel,SpecificChefMealsModel>>getChefMeals({required String chefIId});

 Future<Either<ErrorModel,String>>deleteMyAccount({required String chefId});

 Future<Either<ErrorModel,String>>logOut();







}