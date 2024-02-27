part of 'add_meal_cubit.dart';

@immutable
abstract class AddMealState {}

class AddMealInitial extends AddMealState {}

class AddMealCategoryChanged extends AddMealState {}

class AddMealRadioValueChanged extends AddMealState {}


