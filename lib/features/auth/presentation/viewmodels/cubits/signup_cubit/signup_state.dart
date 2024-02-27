part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class ChangeSignupEyeState extends SignupState {}

class ChangeConfirmSignupEyeState extends SignupState {}


class ChangeProfilePhoto extends SignupState {}
class SignupLoadingState extends SignupState {}
class SignupSuccessState extends SignupState {
  final String successMessage;

  SignupSuccessState({required this.successMessage});

}
class SignupFailureState extends SignupState {
  final String errorMessage;

  SignupFailureState({required this.errorMessage});

}


