

import 'package:dartz/dartz.dart';

import '../models/login_model/login_model.dart';

abstract class AuthRepo
{

  Future<Either<String,LoginModel>>login({required String email,required String password});

}