import 'package:bloc/bloc.dart';
import 'package:chef_app/features/auth/data/models/login_model/login_model.dart';
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

  GlobalKey<FormState> loginFormKey=GlobalKey();


  IconData suffixIcon=Icons.visibility_off;
  bool isObsecureText=true;

  changeEyeShape()
  {
    if(suffixIcon==Icons.visibility_off)
    {
      suffixIcon=Icons.visibility;
      isObsecureText=false;
    }
    else
    {
      suffixIcon=Icons.visibility_off;
      isObsecureText=true;
    }

    emit(ChangePasswordEyeShape());

  }


 loginFun({required String email,required String password}) async
 {
   emit(LoginLoadingState());
   final response=await authRepoImplementation.login(
       email: email,
       password: password);

   response.fold((errorMessage) => LoginFailureState(errorMessage: errorMessage),
         (successMessage) => LoginSuccessState(successLoginModel: successMessage),);

 }






}
