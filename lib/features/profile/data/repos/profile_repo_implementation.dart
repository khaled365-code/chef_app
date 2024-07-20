



import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/features/profile/data/models/chef_info_model/chef_info_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepoImplementation implements ProfileRepo
{

  final ApiConsumer api;

  ProfileRepoImplementation({required this.api});

  @override
  Future<Either<ErrorModel, ChefInfoModel>> getChefData({required String chefIId}) async
  {

    try
    {
      final response=await api.get(EndPoints.getChefDataEndPoint(chefIId: chefIId));
      ChefInfoModel chefInfoModel=ChefInfoModel.fromJson(response);
       await CacheHelper().saveData(key: ApiKeys.profilePic, value: chefInfoModel.chef!.profilePic);
      await CacheHelper().saveData(key: ApiKeys.phone, value: chefInfoModel.chef!.phone);
      await CacheHelper().saveData(key: ApiKeys.brandName, value: chefInfoModel.chef!.brandName);
      await CacheHelper().saveData(key: ApiKeys.minCharge, value: chefInfoModel.chef!.minCharge);
      await CacheHelper().saveData(key: ApiKeys.description, value: chefInfoModel.chef!.disc);
      await CacheHelper().saveData(key: ApiKeys.healthCertificate, value: chefInfoModel.chef!.healthCertificate);
      await Future.delayed(const Duration(milliseconds: 100));

      return Right(chefInfoModel);
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel);
    }


  }






}