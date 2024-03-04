part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}
class LogoutLoadingState extends LogoutState {}
class LogoutFailureState extends LogoutState {
  final String errorMessage;

  LogoutFailureState({required this.errorMessage});

}
class LogoutSuccessState extends LogoutState {

  final String successMessage;

  LogoutSuccessState({required this.successMessage});
}

