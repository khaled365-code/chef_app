


import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class HomeRepoImplementation implements HomeRepo {  
  
  final ApiConsumer api;

  HomeRepoImplementation({required this.api});

  @override
  Future<Either<String, String>> updateProfile(
      {required String profileName,
      required String phone,
      required String brandName,
      required String charge,
      required String description,
      required XFile profilePic}) async {
    try {
      final response = await api.patch(EndPoint.updateProfile,
          data: {
            ApiKeys.name: profileName,
            ApiKeys.phone: phone,
            ApiKeys.brandName: brandName,
            ApiKeys.minCharge: charge,
            ApiKeys.disc: description,
            ApiKeys.profileImage: profilePic,
            ApiKeys.location:
                '{"name":"methalfa","address":"meet halfa","coordinates":[1214451511,12541845]}',
          },
          formData: true);
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, String>> changePassword({required String oldPass, required String newPass, required String confirmPass}) async
  {
    try {
      final response = await api.patch(EndPoint.chefChangePass, data: {
        ApiKeys.oldPass: oldPass,
        ApiKeys.newPass: newPass,
        ApiKeys.confirmPassword: confirmPass
      });
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e)
    {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, String>> logout() async
  {
    try {
      final response = await api.get(EndPoint.chefLogout);
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e)
    {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, String>> deleteChef(id) async
  {

    try
    {
      final response= await api.delete(
        EndPoint.deleteChef(id),);

      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }

  }





}
