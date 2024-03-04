import 'package:bloc/bloc.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.homeRepoImplementation}) : super(LogoutInitial());

  final HomeRepoImplementation homeRepoImplementation;


  logout()async
  {
    emit(LogoutLoadingState());
    final result=await homeRepoImplementation.logout();
    result.fold((error) => emit(LogoutFailureState(errorMessage: error))
        , (success) => emit(LogoutSuccessState(successMessage: success)));


  }

}
