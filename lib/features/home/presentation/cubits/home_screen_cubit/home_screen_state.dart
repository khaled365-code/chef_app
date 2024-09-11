part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class LocationSwitchedState extends HomeScreenState {}

final class GetChefDataLoadingState extends HomeScreenState {}
final class GetChefDataErrorState extends HomeScreenState {
  final ErrorModel errorModel;

  GetChefDataErrorState({required this.errorModel});
}
final class GetChefDataSuccessState extends HomeScreenState {
  final ChefInfoModel chefInfoModel;

  GetChefDataSuccessState({required this.chefInfoModel});
}

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


final class GetCachedFavouriteMealsSuccessState extends HomeScreenState {

  GetCachedFavouriteMealsSuccessState();

}

final class GetCachedFavouriteMealsFailureState extends HomeScreenState {
  final String errorMessage;
  GetCachedFavouriteMealsFailureState({required this.errorMessage});
}




final class GetCachedHistoryMealsSuccessState extends HomeScreenState {

  final List<Meals> historyMealsList;
  GetCachedHistoryMealsSuccessState({required this.historyMealsList});

}

final class GetCachedHistoryMealsFailureState extends HomeScreenState {

  final String errorMessage;
  GetCachedHistoryMealsFailureState({required this.errorMessage});
}


final class GetLocalNotificationsFailureState extends HomeScreenState {

  final String errorMessage;

  GetLocalNotificationsFailureState({required this.errorMessage});
}
final class GetLocalNotificationsSuccessState extends HomeScreenState {


}






