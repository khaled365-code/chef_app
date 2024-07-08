import 'package:bloc/bloc.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.homeRepoImplementation}) : super(UpdateProfileInitial());

  final HomeRepoImplementation homeRepoImplementation;
  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController brandController =TextEditingController();
  TextEditingController chargeController =TextEditingController();
  TextEditingController descController =TextEditingController();

GlobalKey<FormState> updateProfileKey=GlobalKey<FormState>();


  XFile? profileImage;

  updateImage(XFile image)
  {
    profileImage=image;
    emit(UpdateProfilePicState());

  }

  updateProfile() async
  {
    emit(UpdateProfileLoadingState());
   final result= await homeRepoImplementation.updateProfile(
        profileName: nameController.text,
        phone: phoneController.text,
        brandName: brandController.text,
        charge: chargeController.text,
        description: descController.text,
        profilePic:  profileImage!);

   result.fold((error) => emit(UpdateProfileFailureState(errorMessage: error))
       , (successMessage) => emit(UpdateProfileSuccessState(successMessage: successMessage)));

  }


}
