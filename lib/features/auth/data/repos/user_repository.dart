


import 'package:chef_app/features/auth/data/models/code_response_model.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/models/signup_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepo
{
  Future<Either<String,LoginModel>> login({required String email,required String password });
  Future<Either<String,SignUpModel>> signup({required String email,required String password,required String confirmPassword,required String name,required String phone,required String prand,required String disc,required XFile profilePic });
  Future<Either<String,CodeModel>>sendCode({required String email});
  Future<Either<String,String>>resetPassword({required String email,required String password,required String confirmPassword,required String code});



}