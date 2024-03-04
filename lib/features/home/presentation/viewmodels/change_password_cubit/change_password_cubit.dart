import 'package:bloc/bloc.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.homeRepoImplementation}) : super(ChangePasswordInitial());


  TextEditingController oldPassController =TextEditingController();
  TextEditingController newPassController =TextEditingController();
  TextEditingController confirmPassController =TextEditingController();
  GlobalKey<FormState> changePassKey=GlobalKey<FormState>();
  IconData suffixIcon=Icons.visibility_off_outlined;
  bool securePassword=true;
  IconData suffixIcon2=Icons.visibility_off_outlined;
  bool securePassword2=true;
  IconData suffixIcon3=Icons.visibility_off_outlined;
  bool securePassword3=true;


  final HomeRepoImplementation homeRepoImplementation;

  changePassword() async
  {
    emit(ChangePasswordLoading());
   final result= await homeRepoImplementation.changePassword(
        oldPass: oldPassController.text,
        newPass: newPassController.text,
        confirmPass: confirmPassController.text);

   result.fold((error) => emit(ChangePasswordFailure(errorMessage: error))
       , (success) => emit(ChangePasswordSuccess(successMessage: success)));

  }

  changePasswordEye()
  {
    securePassword=!securePassword;
    suffixIcon=securePassword ? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangePasswordEyeState());

  }
  changePasswordEye2()
  {
    securePassword2=!securePassword2;
    suffixIcon2=securePassword2 ? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangePasswordEyeState2());

  }changePasswordEye3()
  {
    securePassword3=!securePassword3;
    suffixIcon3=securePassword3 ? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangePasswordEyeState3());

  }

}
