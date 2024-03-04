part of 'add_meal_cubit.dart';

@immutable
abstract class AddMealState {}

class AddMealInitial extends AddMealState {}

class AddMealCategoryChanged extends AddMealState {}

class AddMealRadioValueChanged extends AddMealState {}

class AddMealSuccessState extends AddMealState {
   final String succesMessage;

  AddMealSuccessState({required this.succesMessage});

}
class AddMealFailureState extends AddMealState {
  final String errorMessage;

  AddMealFailureState({required this.errorMessage});



}
class AddMealLoadingState extends AddMealState {}



