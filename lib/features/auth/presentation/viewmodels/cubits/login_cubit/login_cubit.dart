import 'package:chef_app/features/auth/data/repos/user_repository_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.user}) : super(LoginInitial());
  final UserRepoImplementation user;
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  bool passwordHide=true;
  IconData suffixIcon=Icons.visibility_off;
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  signin() async
  {
    emit(LoginLoadingState());

    final response=await user.login(email: emailController.text, password: passwordController.text);

   response.fold((error) => emit(LoginFailureState(errorMessage: error)),
        (loginModel) => emit(LoginSuccessState()));
  }
  void changePasswordEye()
  {
    suffixIcon=passwordHide?Icons.visibility:Icons.visibility_off;
    passwordHide=!passwordHide;
    emit(ChangeLoginEyeState());

  }

}
