import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/features/profile/data/models/chef_info_model/chef_info_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'get_chef_data_state.dart';

class GetChefDataCubit extends Cubit<GetChefDataState> {
  GetChefDataCubit({required this.profileRepoImplementation}) : super(GetChefDataInitial());


  final ProfileRepoImplementation profileRepoImplementation;



  getChefDataFun({required String chefIId}) async
  {
    emit(GetChefDataLoadingState());
    final response=await profileRepoImplementation.getChefData(chefIId: chefIId);

    response.fold(
        (errorModel) => emit(GetChefDataErrorState(errorModel: errorModel)),
        (chefInfoModel) => emit(GetChefDataSuccessState(chefInfoModel: chefInfoModel)));

  }




}
