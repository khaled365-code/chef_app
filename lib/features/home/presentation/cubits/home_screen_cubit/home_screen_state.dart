part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class RemoveMealFromFavouritesState extends HomeScreenState {}

final class AddFavouriteMealToHistoryState extends HomeScreenState {}


final class ChangeMealFavouriteActiveShapeState extends HomeScreenState {}

final class ChangeCurrentSelectedCategoryPositionState extends HomeScreenState {}


final class GetAllMealsLoadingState extends HomeScreenState {}


final class GetAllMealsSuccessState extends HomeScreenState {

  final GetAllMealsModel getAllMealsModel;
  GetAllMealsSuccessState({required this.getAllMealsModel});
}


final class GetAllMealsFailureState extends HomeScreenState {

  final ErrorModel errorModel;
  GetAllMealsFailureState({required this.errorModel});
}

final class GetCachedFavouriteMealsLoadingState extends HomeScreenState {}

final class GetCachedFavouriteMealsSuccessState extends HomeScreenState {

  GetCachedFavouriteMealsSuccessState();

}

final class GetCachedFavouriteMealsFailureState extends HomeScreenState {
  final String errorMessage;
  GetCachedFavouriteMealsFailureState({required this.errorMessage});
}







