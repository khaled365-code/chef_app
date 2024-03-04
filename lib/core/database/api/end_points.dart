


import 'package:image_picker/image_picker.dart';

class EndPoint
{
  static const String baseUrl="https://food-api-omega.vercel.app/api/v1";
  static const String signUp="/chef/signup";
  static const String signIn="/chef/signin";
  static const String sendCode='/chef/send-code';
  static const String forgetPassChange='/chef/change-forgotten-password';
  static const String addMeal='/meal/add-to-menu';
  static const String updateProfile='/chef/update';
  static const String chefChangePass='/chef/change-password';
  static const String chefLogout='/chef/logout';



  static String getAllChefMeals(id)
  {
    return '/chef/get-chef/$id/meals';
  }
  static String deleteMeal(id)
  {
    return '/meal/delete-meal/$id';
  }


}

class ApiKeys
{
  static  String status='status';
  static  String errorMessage='ErrorMessage';
  static  String email='email';
  static  String password='password';
  static  String message='message';
  static  String token='token';
  static  String id='id';
  static  String name='name';
  static  String phone='phone';
  static  String confirmPassword='confirmPassword';
  static  String location='location';
  static  String healthImage='healthCertificate';
  static  String frontImage='frontId';
  static  String backImage='backId';
  static  String profileImage='profilePic';
  static  String brandName='brandName';
  static  String minCharge='minCharge';
  static  String disc='disc';
  static  String code='code';
  static  String description='description';
  static  String price='price';
  static  String category='category';
  static  String mealImage='mealImages';
  static  String howToSell='howToSell';
  static  String oldPass='oldPass';
  static  String newPass='newPass';
  static  String meals='meals';




















}