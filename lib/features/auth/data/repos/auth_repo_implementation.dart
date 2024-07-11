

import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/auth/data/models/login_model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../core/database/api/end_points.dart';
import 'auth_repo.dart';

class AuthRepoImplementation implements AuthRepo
{

  final ApiConsumer api;

  AuthRepoImplementation({required this.api});


  @override
  Future<Either<String, LoginModel>> login({required String email, required String password}) async
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
      return Left(e.errorModel.errorMessage);
    }
  }






}