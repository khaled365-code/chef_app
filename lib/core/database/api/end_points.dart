

class EndPoints
{

  static const String baseUrl='https://food-api-omega.vercel.app/api/v1';
  static const String signUp='/chef/signup';
  static const String signIn='/chef/signin';
  static const String checkEmail='/chef/check-email';
  static const String sendCode='/chef/send-code';
  static const String forgetPassChange='/chef/change-forgotten-password';
  static const String changePass='/chef/change-password';
  static const String updateChef='/chef/update';
  static const String deleteChef='/chef/delete?id=649789d769bd2c36dce15979';
  static const String changeChefStatus='/chef/change-chef-status';
  static const String chefData='/chef/get-chef/64d740ef60d32a897c6dfbdf';
  static const String chefLogout='/chef/logout';
  static const String chefMeals='/chef/get-chef/64c2a4f83eb093d6caf29533/meals';
  static const String addMeal='/meal/add-to-menu/meal/add-to-menu';
  static const String updateMeal='/chef/update-meal/64a6e3ea0f8c2b74e0eb2d77';
  static const String deleteMeal='/meal/delete-meal/64ce29541643ae79d15fc123';
  static const String getAllMeal='/meal/get-meals';

  static String getdeleteChef(id)
  {
    return '$deleteChef$id';
  }
  static String getChefData(id)
  {
    return '$chefData$id';
  }
  static String getChefMeals(id)
  {
    return '$chefMeals$id';
  }
  static String doUpdateMeal(id)
  {
    return '$updateMeal$id';
  }static String doDeleteMeal(id)
  {
    return '$deleteMeal$id';
  }






















}