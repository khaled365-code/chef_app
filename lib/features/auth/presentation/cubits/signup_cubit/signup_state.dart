part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}


final class UploadSignupImageState extends SignupState {}


final class DeleteSignupImageState extends SignupState {}

final class SignUpLoadingState extends SignupState {}

final class SignUpSuccessState extends SignupState {

  final String message;
  SignUpSuccessState({required this.message});
}


final class SignUpFailureState extends SignupState {

  final String message;
  SignUpFailureState({required this.message});
}


final class ChangePickerGalleryState extends SignupState {}

final class ChangePickerCameraState extends SignupState {}


final class UploadHealthCertificateImageState extends SignupState {}

final class DeleteHealthCertificateImageState extends SignupState {}




