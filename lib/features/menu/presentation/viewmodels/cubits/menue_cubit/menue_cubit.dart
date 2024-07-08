import 'package:bloc/bloc.dart';
import 'package:chef_app/features/menu/data/models/MealModel.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/database/api/api_keys.dart';
import '../../../../../../core/database/api/end_points.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../data/models/Meals.dart';

part 'menue_state.dart';

class MenueCubit extends Cubit<MenueState> {
  MenueCubit({required this.menueRepoImplementation}) : super(MenueInitial());

  final MenueRepoImplementation menueRepoImplementation;


  List<Meals>? meals=[];
  getAllMeals() async
  {
     emit(MenueMealsGetLoadingState());
    final result= await menueRepoImplementation.getAllMeals(id: CacheHelper.sharedPreferences.get(ApiKeys.id));
    result.fold((error) =>emit(MenueMealsGetFailureState(errorMessage: error))
    , (mealModel)
        {
          emit(MenueMealsGetSuccessfullyState(successMessage: mealModel.message.toString()));
         meals=mealModel.meals;
        });
     


  }



}
