import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  TextEditingController passwordController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  bool passwordHiddden=true;
  GlobalKey<FormState> signuUpKey= GlobalKey<FormState>();
  IconData icon=Icons.visibility_off;

  void changeSignUpEye()
  {
    icon=passwordHiddden?Icons.visibility:Icons.visibility_off;
    passwordHiddden=!passwordHiddden;
    emit(ChangeSignupEyeState());


  }




}
