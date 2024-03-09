part of 'delete_account_cubit.dart';

@immutable
abstract class DeleteAccountState {
  get errorMessage => null;
}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoadingState extends DeleteAccountState {}
class DeleteAccountSuccessState extends DeleteAccountState {

  final String successMessage;

  DeleteAccountSuccessState({required this.successMessage});

}
class DeleteAccountFailureState extends DeleteAccountState {

  final String errorMessage;

  DeleteAccountFailureState({required this.errorMessage});

}

