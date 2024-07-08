


import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/features/auth/data/models/code_response_model.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/models/signup_model.dart';
import 'package:chef_app/features/auth/data/repos/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/database/errors/server_exception.dart';
import '../../../../core/commons/commons.dart';

class UserRepoImplementation implements UserRepo {


  final ApiConsumer api;

  UserRepoImplementation({required this.api});
  @override
  Future<Either<String, LoginModel>> login({required String email, required String password}) async {

    try
    {
      final response = await api.post(EndPoints.signIn, data: {
        ApiKeys.email:email,
        ApiKeys.password:password
      });
      final user=LoginModel.fromjson(response);
      final decodedToken=JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKeys.token, value: user.token);
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      return Right(user);
    } on ServerException catch(e)
    {
       return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, SignUpModel>> signup({required String email, required String password, required String confirmPassword, required String name, required String phone, required String prand, required String disc,required XFile profilePic}) async
  {

    try
    {
      final response= await api.post(
          EndPoints.signUp,
          data:{
            ApiKeys.name:name,
            ApiKeys.email:email,
            ApiKeys.password:password,
            ApiKeys.confirmPassword:confirmPassword,
            ApiKeys.phone:phone,
            ApiKeys.location:'{"name":"methalfa","address":"meet halfa","coordinates":[1214451511,12541845]}',
            ApiKeys.brandName:prand,
            ApiKeys.minCharge:'5000',
            ApiKeys.disc:disc,
            ApiKeys.healthImage: await uploadImageToAPI(profilePic),
            ApiKeys.frontImage:  await uploadImageToAPI(profilePic),
            ApiKeys.backImage:   await uploadImageToAPI(profilePic),
            ApiKeys.profileImage:await uploadImageToAPI(profilePic),
          },
          formData: true
      );
      final signUpModel=SignUpModel.fromjson(response);
      return Right(signUpModel);
    } on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, CodeModel>> sendCode({required String email}) async
  {
    try {
      final response=await api.post(
        EndPoints.sendCode,
        data:
        {
          ApiKeys.email:email
        },

      );
      final codeModel=CodeModel.fromJson(response);
      return Right(codeModel);
    } on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }

  }

  @override
  Future<Either<String, String>> resetPassword({required String email,required String password, required String confirmPassword, required String code}) async {
  
    try
    {
    final response= await api.patch(EndPoints.forgetPassChange,
      data: {
        ApiKeys.email:email,
        ApiKeys.password:password,
        ApiKeys.confirmPassword:confirmPassword,
        ApiKeys.code:code,
      },
      );
      return Right(response[ApiKeys.message]);
          
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }
  }


}
