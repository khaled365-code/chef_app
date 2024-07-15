import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit({required this.authRepoImplementation}) : super(ForgetPassInitial());

  final AuthRepoImplementation authRepoImplementation;

  TextEditingController emailForForgetPassController=TextEditingController();

  GlobalKey<FormState> sendEmailFormKey=GlobalKey();

  GlobalKey<FormState> verifyCodeFormKey=GlobalKey();


  TextEditingController firstCodeController=TextEditingController();
  TextEditingController secondCodeController=TextEditingController();
  TextEditingController thirdCodeController=TextEditingController();
  TextEditingController fourthCodeController=TextEditingController();
  TextEditingController fifthCodeController=TextEditingController();
  TextEditingController sixthCodeController=TextEditingController();




  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmNewPasswordController=TextEditingController();



  forgetPassSendCodeFun({required String email}) async
  {
    emit(ForgetPassSendCodeLoadingState());

    final response=await authRepoImplementation.forgetPasswordSendCode(
        email: email);

    response.fold((errorModel) => emit(ForgetPassSendCodeFailureState(errorModel: errorModel),),
        (message) =>emit(ForgetPassSendCodeSuccessState(message: message)));

  }


  forgetPassChangeWithCodeFun({required String email,required String code,required String password,required String confirmPassword}) async
  {
    emit(ForgetPassChangeWithCodeLoadingState());

    final response=await authRepoImplementation.forgetPassChangeWithCode(
        email: email,
        code: code,
        password: password,
        confirmPassword: confirmPassword);

    response.fold((errorModel) => emit(ForgetPassChangeWithCodeFailureState(errorModel: errorModel),),
            (message) =>emit(ForgetPassChangeWithCodeSuccessState(message: message)));


  }






}
