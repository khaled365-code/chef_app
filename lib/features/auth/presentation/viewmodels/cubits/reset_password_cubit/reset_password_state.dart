part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}


class ResetPasswordChangeEye extends ResetPasswordState {}
class ResetPasswordChangeConfirmEye extends ResetPasswordState {}


class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {

  final String errorMessage;

  ResetPasswordFailure({required this.errorMessage});

}


class ResetPasswordSuccess extends ResetPasswordState {

  final String successMessage;

  ResetPasswordSuccess({required this.successMessage});

}

