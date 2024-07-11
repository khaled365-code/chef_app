import 'package:bloc/bloc.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepoImplementation}) : super(LoginInitial());


  AuthRepoImplementation authRepoImplementation;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  IconData suffixIcon=Icons.visibility_off;

  changeEyeShape()
  {
    if(suffixIcon==Icons.visibility_off)
    {
      suffixIcon=Icons.visibility;
    }
    else
    {
      suffixIcon=Icons.visibility_off;
    }

    emit(ChangePasswordEyeShape());

  }






}
