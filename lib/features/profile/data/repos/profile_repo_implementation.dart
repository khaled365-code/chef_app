



import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/profile/data/models/specific_chef_meals_model/chef_meals_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImplementation implements ProfileRepo
{

  final ApiConsumer api;

  ProfileRepoImplementation({required this.api});


  @override
  Future<Either<ErrorModel, SpecificChefMealsModel>> getChefMeals({required String chefIId}) async
  {
    try
    {
      final response=await api.get(EndPoints.getSingleChefMealsEndPoint(chefIId: chefIId));
      SpecificChefMealsModel specificChefMealsModel=SpecificChefMealsModel.fromJson(response);
      return Right(specificChefMealsModel);
    } on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> deleteMyAccount({required String chefId}) async
  {
    try
    {
      final response=await api.delete(EndPoints.deleteAccountEndPoint(chefIId: chefId));
      return Right(response[ApiKeys.message]);
    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> logOut() async {

    try
    {
      final response=await api.get(EndPoints.chefLogoutEndPoint);
      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
       return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> changePasswordForAccount({required String oldPassword, required String newPassword, required String confirmPassword}) async
  {
    try
    {

      final response=await api.patch(EndPoints.changePasswordForAccountEndPoint,
      data: {
        ApiKeys.oldPass:oldPassword,
        ApiKeys.newPass:newPassword,
        ApiKeys.confirmPassword:confirmPassword
      });

      return Right(response[ApiKeys.message]);

    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }


  }

  @override
  Future<Either<ErrorModel, String>> updateProfile({ String? name, String? phone,
     String? brandName, double? minCharge,
     String? disc, MultipartFile? profilePic}) async
  {
    try
    {
      String location='{"name":"Egypt","address":"Mansoura","coordinates":[31.058748054104402, 31.40931322993143]}';
      Map<String,dynamic> data={};
      data[ApiKeys.location]=location;
      if(name!=null)
        {
          data[ApiKeys.name]=name;
        }
      if(phone!=null)
        {
          data[ApiKeys.phone]=phone;
        }
      if(brandName!=null)
        {
          data[ApiKeys.brandName]=brandName;
        }
      if(minCharge!=null)
        {
          data[ApiKeys.minCharge]=minCharge;
        }
      if(disc!=null)
        {
          data[ApiKeys.disc]=disc;
        }

      if(profilePic!=null)
        {
          data[ApiKeys.profilePic]=profilePic;
        }
      final response=await api.patch(
          EndPoints.updateProfileEndPoint,
          data: data
          ,formData: true);
      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
     return Left(e.errorModel);
    }
  }






}