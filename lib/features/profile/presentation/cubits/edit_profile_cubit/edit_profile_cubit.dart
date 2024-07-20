import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.profileRepoImplementation}) : super(EditProfileInitial());


  final ProfileRepoImplementation profileRepoImplementation;

  var phoneMaskFormatter =  MaskTextInputFormatter(
      mask: '###-###-#####',
  );


  XFile? newProfilePhoto;


  updateProfilePhoto({required XFile image})
  {
    newProfilePhoto=image;
    emit(UpdateProfilePhotoState());
  }

  deleteProfilePhoto()
  {
    newProfilePhoto=null;
    emit(DeleteProfilePhotoState());
  }


  TextEditingController nameController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.name)
  );
  TextEditingController phoneController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.phone).substring(0,3)+'-'+CacheHelper().getData(key: ApiKeys.phone).substring(3,6)+'-'+CacheHelper().getData(key: ApiKeys.phone).substring(6)
  );
  TextEditingController brandNameController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.brandName)
  );
  TextEditingController minChargeController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.minCharge).toString()
  );
  TextEditingController discController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.description)
  );









}
