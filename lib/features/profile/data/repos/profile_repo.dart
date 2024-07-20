
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:dartz/dartz.dart';

import '../models/chef_info_model/chef_info_model.dart';

abstract class ProfileRepo
{


 Future<Either<ErrorModel,ChefInfoModel>>getChefData({required String chefIId});






}