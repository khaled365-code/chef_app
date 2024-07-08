
class EndPoints
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


  static String deleteChef(id)
  {
    return '/chef/delete?id=$id';
  }

  static String updateMeal(id)
  {
    return '/chef/update-meal/$id';
  }



  static String getAllChefMeals(id)
  {
    return '/chef/get-chef/$id/meals';
  }
  static String deleteMeal(id)
  {
    return '/meal/delete-meal/$id';
  }


}
