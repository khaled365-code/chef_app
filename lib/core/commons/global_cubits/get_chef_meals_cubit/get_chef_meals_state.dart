part of 'get_chef_meals_cubit.dart';

@immutable
abstract class GetChefMealsState {}

class GetChefMealsInitial extends GetChefMealsState {}

class GetChefMealsLoading extends GetChefMealsState {}
class GetChefMealsSuccess extends GetChefMealsState {

  final MealModel mealModelResponse;

  GetChefMealsSuccess({required this.mealModelResponse});
}
class GetChefMealsFailure extends GetChefMealsState {

  final String errorMessage;

  GetChefMealsFailure({required this.errorMessage});
}

