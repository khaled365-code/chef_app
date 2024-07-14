

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/login_model/login_model.dart';

abstract class AuthRepo
{

  Future<Either<String,LoginModel>>login({required String email,required String password});
  Future<Either<String,String>>signup({
    required String name,required String phone
    ,required String email, required String password,
    required String passwordConfirmation,required String location ,
    required String brandName, required double minimumCharge,
    required String description, required MultipartFile healthCertificate,
    required MultipartFile frontId,required MultipartFile backId,
    required MultipartFile profilePic});

}