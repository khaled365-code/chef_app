import 'package:chef_app/features/auth/data/models/signup_model.dart';
import 'package:chef_app/features/auth/data/repos/user_repository_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.user}) : super(SignupInitial());
  UserRepoImplementation user;
  TextEditingController passwordController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController confirmPassword =TextEditingController();
  TextEditingController name =TextEditingController();
  TextEditingController phoneNumber =TextEditingController();
  TextEditingController prand =TextEditingController();
  TextEditingController disc =TextEditingController();
  SignUpModel? signUpModel;




  bool passwordHiddden=true;
  bool confirmPasswordHiddden=true;

  GlobalKey<FormState> signuUpKey= GlobalKey<FormState>();
  IconData icon=Icons.visibility_off;
  IconData confirmIcon=Icons.visibility_off;


  XFile? profilePic;

  void changeSignUpEye()
  {
    icon=passwordHiddden?Icons.visibility:Icons.visibility_off;
    passwordHiddden=!passwordHiddden;
    emit(ChangeSignupEyeState());


  }
  void changeConfirmSignUpEye()
  {
    confirmIcon=confirmPasswordHiddden?Icons.visibility:Icons.visibility_off;
    confirmPasswordHiddden=!confirmPasswordHiddden;
    emit(ChangeConfirmSignupEyeState());


  }

  updateProfileImage(XFile image)
  {
    profilePic=image;
    emit(ChangeProfilePhoto());
  }

  signUp() async
  {

    emit(SignupLoadingState());
    final response= await user.signup(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPassword.text,
        name: name.text,
        phone: phoneNumber.text,
        prand: prand.text,
        disc: disc.text,
        profilePic: profilePic!);

    response.fold((error) => emit(SignupFailureState(errorMessage: error)),
            (signupModel) => emit(SignupSuccessState(successMessage: signupModel.message)));

  }
  /*
  zamora
  zamoralegacy123@gmail.com
  yassermiral402@gmail.com
  khaled00000
  khaled00000
  01201034120
  hola brand()
  ahmed mahmoud yahia mohamed disc()
  12000



  */




}
