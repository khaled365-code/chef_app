
class EndPoints
{
  static const String baseUrl="https://food-api-omega.vercel.app/api/v1";

  static const String logInEndPoint='$baseUrl/chef/signin';
  static const String signUpEndPoint='$baseUrl/chef/signup';

  static const String forgetPasswordSendCodeEndPoint='$baseUrl/chef/send-code';

  static const String forgetPassChangeWithCodeEndPoint='$baseUrl/chef/change-forgotten-password';

  static const String getAllChefsMealsEndPoint='$baseUrl/meal/get-meals';


  static const String addNewMealEndPoint='$baseUrl/meal/add-to-menu';


  static String updateMealEndPoint({required String mealId})
  {
    return '$baseUrl/meal/update-meal/$mealId';
  }

  static String deleteMealEndPoint({required String mealId})
  {
    return '$baseUrl/meal/delete-meal/$mealId';
  }

  static String getChefDataEndPoint({required String chefIId})
  {
    return '$baseUrl/chef/get-chef/$chefIId';
  }

  static String getSingleChefMealsEndPoint({required String chefIId})
  {
    return '$baseUrl/chef/get-chef/$chefIId/meals';
  }






}
