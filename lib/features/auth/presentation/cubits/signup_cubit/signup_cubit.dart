import 'package:bloc/bloc.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
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


  GlobalKey<FormState> signupFormKey=GlobalKey();


  XFile? signupImage;

  uploadSignupImage({required XFile image})
  {
    signupImage=image;
    emit(UploadSignupImageState());

  }

  deleteSignupImage()
  {
    signupImage=null;
    emit(DeleteSignupImageState());
  }

  XFile? healthCertificateImage;
  uploadHealthCertificateImage({required XFile image})
  {
    healthCertificateImage=image;
    emit(UploadHealthCertificateImageState());

  }

  deleteHealthCertificateImage()
  {
    healthCertificateImage=null;
    emit(DeleteHealthCertificateImageState());
  }
  signupFun({
    required String name, required String phone,
    required String email, required String password,
    required String passwordConfirmation,
    required String brandName, required double minimumCharge,
    required String description,}) async
  {
    emit(SignUpLoadingState());
   final response=await authRepoImplementation.signup(name: name, phone: phone,
       email: email, password: password,
       passwordConfirmation: passwordConfirmation, location: '{"name":"Mansoura","address":"Dakahlia Egypt","coordinates":[31.04352521315619, 31.38737220898334]}',
       brandName: brandName, minimumCharge: minimumCharge,
       description: description, healthCertificate: await uploadImageToAPI(healthCertificateImage!),
       frontId: await uploadImageToAPI(healthCertificateImage!), backId: await uploadImageToAPI(healthCertificateImage!),
       profilePic: await uploadImageToAPI(signupImage!));


   response.fold((errorMessage) => emit(SignUpFailureState(message: errorMessage)),
           (successMessage) => emit(SignUpSuccessState(message: successMessage)));


  }

}
