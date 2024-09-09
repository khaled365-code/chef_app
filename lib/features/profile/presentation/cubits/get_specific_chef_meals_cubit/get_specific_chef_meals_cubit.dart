import 'package:bloc/bloc.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/errors/error_model.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals_model.dart';

part 'get_specific_chef_meals_state.dart';

class GetSpecificChefMealsCubit extends Cubit<GetSpecificChefMealsState> {
  GetSpecificChefMealsCubit({required this.profileRepoImplementation}) : super(GetSpecificChefMealsInitial());

  static GetSpecificChefMealsCubit get(context) => BlocProvider.of(context);
  final ProfileRepoImplementation profileRepoImplementation;

  List<SpecificChefMeals>? chefMeals;
  getSpecificChefMealsFun({required String chefId}) async
  {
    emit(GetSpecificChefMealsLoadingState());
    final response=await profileRepoImplementation.getChefMeals(chefIId: chefId);


    response.fold(
    (errorModel) => emit(GetSpecificChefMealsFailureState(errorModel: errorModel)),
            (chefMealsModel)
           {
             chefMeals=chefMealsModel.meals;
              emit(GetSpecificChefMealsSuccessState(
                  specificChefMealsModel: chefMealsModel));
            });

  }

}
