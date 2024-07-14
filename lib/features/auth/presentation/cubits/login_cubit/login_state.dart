part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangePasswordEyeShape extends LoginState {}

final class LoginLoadingState extends LoginState {}


final class LoginSuccessState extends LoginState {

  final LoginModel successLoginModel;

  LoginSuccessState({required this.successLoginModel});

}


final class LoginFailureState extends LoginState {

  final NewErrorModel theError;

  LoginFailureState({required this.theError});
}



