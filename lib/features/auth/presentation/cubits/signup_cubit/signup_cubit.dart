import 'package:bloc/bloc.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepoImplementation}) : super(SignupInitial());


  AuthRepoImplementation authRepoImplementation;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minimumChargeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



}
