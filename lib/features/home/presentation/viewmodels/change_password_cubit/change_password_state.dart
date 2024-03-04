part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordEyeState extends ChangePasswordState {}

class ChangePasswordEyeState2 extends ChangePasswordState {}
class ChangePasswordEyeState3 extends ChangePasswordState {}




class ChangePasswordLoading extends ChangePasswordState {}
class ChangePasswordFailure extends ChangePasswordState {

  final String errorMessage;

  ChangePasswordFailure({required this.errorMessage});

}
class ChangePasswordSuccess extends ChangePasswordState {

  final String successMessage;

  ChangePasswordSuccess({required this.successMessage});
}

