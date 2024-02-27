import 'package:chef_app/features/auth/data/repos/user_repository_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  SendCodeCubit({required this.userRepo}) : super(SendCodeInitial());

  final UserRepoImplementation userRepo;

  TextEditingController emailController=TextEditingController();
  GlobalKey<FormState> sendCodeKey =GlobalKey<FormState>();

  sendCode() async
  {
    emit(SendCodeLoading());
    final response=await userRepo.sendCode(email: emailController.text);

    response.fold(
            (error) => emit(SendCodeFailure(errorMessage: error)),
            (message) => emit(SendCodeSuccess(successMessage: message.message)));



  }

}
