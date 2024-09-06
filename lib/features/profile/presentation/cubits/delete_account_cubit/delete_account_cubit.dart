import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({required this.profileRepoImplementation}) : super(DeleteAccountInitial());

  static DeleteAccountCubit get(context) => BlocProvider.of(context);
  final ProfileRepoImplementation profileRepoImplementation;



  deleteMyAccountFun({required String chefId}) async
  {
    emit(DeleteMyAccountLoadingState());

    final response=await profileRepoImplementation.deleteMyAccount(chefId: chefId);
    response.fold((errorModel) {
      emit(DeleteMyAccountFailureState(errorModel: errorModel));
    }, (message) {
      emit(DeleteMyAccountSuccessState(successMessage: message));
    });



  }
}
