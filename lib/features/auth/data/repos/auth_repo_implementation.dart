

import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/auth/data/models/login_model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/errors/new_error_model.dart';
import 'auth_repo.dart';

class AuthRepoImplementation implements AuthRepo
{

  final ApiConsumer api;

  AuthRepoImplementation({required this.api});


  @override
  Future<Either<NewErrorModel, LoginModel>> login({required String email, required String password}) async
  {

    try
    {
      final response=await api.post(EndPoints.logInEndPoint,data:
      {
        ApiKeys.email:email,
        ApiKeys.password:password
      });
      LoginModel loginModel=LoginModel.fromJson(response);
       CacheHelper().saveData(key: ApiKeys.id, value: '${JwtDecoder.decode(loginModel.token)['id']}');
      CacheHelper().saveData(key: ApiKeys.email, value: '${JwtDecoder.decode(loginModel.token)['email']}');
      CacheHelper().saveData(key: ApiKeys.name, value: '${JwtDecoder.decode(loginModel.token)['name']}');
      CacheHelper().saveData(key: ApiKeys.token, value: loginModel.token);
      return Right(loginModel);
    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<NewErrorModel, String>> signup({
    required String name, required String phone,
    required String email, required String password,
    required String passwordConfirmation, required String location,
    required String brandName, required double minimumCharge,
    required String description, required MultipartFile healthCertificate, 
    required MultipartFile frontId, required MultipartFile backId,
     MultipartFile? profilePic}) async
  {
    try
    {
      final response=await api.post(EndPoints.signUpEndPoint,
          data:
          {
            ApiKeys.name:name,
            ApiKeys.phone:phone,
            ApiKeys.email:email,
            ApiKeys.password:password,
            ApiKeys.confirmPassword:passwordConfirmation,
            ApiKeys.location:location,
            ApiKeys.brandName:brandName,
            ApiKeys.minCharge:minimumCharge,
            ApiKeys.disc:description,
            ApiKeys.healthCertificate:healthCertificate,
            ApiKeys.frontId:frontId,
            ApiKeys.backId:backId,
            ApiKeys.profilePic:profilePic
          },formData: true
      );
      return Right(response[ApiKeys.message]);
      
    } on ServerException catch (e) 
    {
      return Left(e.errorModel);
    }
  }






}