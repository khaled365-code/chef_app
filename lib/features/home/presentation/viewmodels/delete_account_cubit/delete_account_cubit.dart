import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({required this.homeRepoImplementation}) : super(DeleteAccountInitial());

  final HomeRepoImplementation homeRepoImplementation;


  deleteAccount() async
  {
    emit(DeleteAccountLoadingState());
    final result=await homeRepoImplementation.deleteChef(CacheHelper().getData(key: ApiKeys.id));

    result.fold((error) => emit(DeleteAccountFailureState(errorMessage: error)),
            (success) => emit(DeleteAccountSuccessState(successMessage: success)));

  }


}
