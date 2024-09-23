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



final class GetLocalNotificationsFailureState extends HomeScreenState {

  final String errorMessage;

  GetLocalNotificationsFailureState({required this.errorMessage});
}
final class GetLocalNotificationsSuccessState extends HomeScreenState {


}






