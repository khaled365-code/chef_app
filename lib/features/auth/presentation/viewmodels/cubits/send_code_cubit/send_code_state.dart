part of 'send_code_cubit.dart';

@immutable
abstract class SendCodeState {}

class SendCodeInitial extends SendCodeState {}
class SendCodeLoading extends SendCodeState {}
class SendCodeSuccess extends SendCodeState {
  final String successMessage;

  SendCodeSuccess({required this.successMessage});

}
class SendCodeFailure extends SendCodeState {

  final String errorMessage;

  SendCodeFailure({required this.errorMessage});

}


