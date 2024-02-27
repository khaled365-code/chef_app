import 'package:bloc/bloc.dart';
import 'package:chef_app/features/auth/data/repos/user_repository_implementation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState>
{
  ResetPasswordCubit({required this.userRepo}) : super(ResetPasswordInitial());

  final UserRepoImplementation userRepo;
  late String email;
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  GlobalKey<FormState>resetPassKey=GlobalKey<FormState>();
  bool passwordHidden=true;
  bool confirmPasswordHidden=true;
  IconData icon=Icons.visibility_off;
  IconData confirmIcon=Icons.visibility_off;



  changeEyeForm()
  {
    icon=passwordHidden?Icons.visibility:Icons.visibility_off;
    passwordHidden=!passwordHidden;
    emit(ResetPasswordChangeEye());

  }
  changeConfirmEye()
  {
    confirmIcon=confirmPasswordHidden?Icons.visibility:Icons.visibility_off;
    confirmPasswordHidden=!confirmPasswordHidden;
    emit(ResetPasswordChangeConfirmEye());

  }

  resetPassword() async
  {
    emit(ResetPasswordLoading());
    final response=await userRepo.resetPassword(
        email: email,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        code: codeController.text);

    response.fold(
            (error) => emit(ResetPasswordFailure(errorMessage: error)),
            (successMeassage) =>emit(ResetPasswordSuccess(successMessage: successMeassage)));
  }



}
