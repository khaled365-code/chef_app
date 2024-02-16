import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  bool passwordHide=true;
  IconData suffixIcon=Icons.visibility_off;
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  void changePasswordEye()
  {
    suffixIcon=passwordHide?Icons.visibility:Icons.visibility_off;
    passwordHide=!passwordHide;
    emit(ChangeLoginEyeState());

  }

}
