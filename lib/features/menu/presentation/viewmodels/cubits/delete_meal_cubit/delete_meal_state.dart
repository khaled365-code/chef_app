part of 'delete_meal_cubit.dart';

@immutable
abstract class DeleteMealState {}

class DeleteMealInitial extends DeleteMealState {}


class DeleteMealSuccessState extends DeleteMealState {
  final String succesMessage;

  DeleteMealSuccessState({required this.succesMessage});

}
class DeleteMealFailureState extends DeleteMealState {
  final String errorMessage;

  DeleteMealFailureState({required this.errorMessage});



}
class DeleteMealLoadingState extends DeleteMealState {}
