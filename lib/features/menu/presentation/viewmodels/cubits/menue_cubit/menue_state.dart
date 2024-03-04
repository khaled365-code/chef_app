part of 'menue_cubit.dart';

@immutable
abstract class MenueState {}

class MenueInitial extends MenueState {}

class MenueMealsGetSuccessfullyState  extends MenueState {

  final String successMessage;
  MenueMealsGetSuccessfullyState({required this.successMessage});

}
class MenueMealsGetLoadingState extends MenueState {}
class MenueMealsGetFailureState extends MenueState {

  final String errorMessage;

  MenueMealsGetFailureState({required this.errorMessage});

}

