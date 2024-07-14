

import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/database/errors/new_error_model.dart';
import '../models/login_model/login_model.dart';

abstract class AuthRepo
{

  Future<Either<NewErrorModel,LoginModel>>login({required String email,required String password});
  Future<Either<NewErrorModel,String>>signup({
    required String name,required String phone
    ,required String email, required String password,
    required String passwordConfirmation,required String location ,
    required String brandName, required double minimumCharge,
    required String description, required MultipartFile healthCertificate,
    required MultipartFile frontId,required MultipartFile backId,
     MultipartFile? profilePic});

}