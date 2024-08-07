import 'package:bloc/bloc.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/errors/error_model.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals_model.dart';

part 'get_specific_chef_meals_state.dart';

class GetSpecificChefMealsCubit extends Cubit<GetSpecificChefMealsState> {
  GetSpecificChefMealsCubit({required this.profileRepoImplementation}) : super(GetSpecificChefMealsInitial());

  final ProfileRepoImplementation profileRepoImplementation;
  getSpecificChefMealsFun({required String chefId}) async
  {
    emit(GetSpecificChefMealsLoadingState());

    final response=await profileRepoImplementation.getChefMeals(chefIId: chefId);

    response.fold(
    (errorModel) => emit(GetSpecificChefMealsFailureState(errorModel: errorModel)),
            (chefMealsModel) => emit(GetSpecificChefMealsSuccessState(
                specificChefMealsModel: chefMealsModel)));

  }

}
