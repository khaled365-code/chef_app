





import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class HomeRepo
{

  Future<Either<String,String>> updateProfile({required String profileName,required String phone,required String brandName,required String charge,required String description,required XFile profilePic});

  Future<Either<String,String>> changePassword({required String oldPass,required String newPass,required String confirmPass});

  Future<Either<String,String>> logout();







}