import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/menu/data/models/MealModel.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:meta/meta.dart';

import '../../../features/menu/data/models/Meals.dart';

part 'get_chef_meals_state.dart';

class GetChefMealsCubit extends Cubit<GetChefMealsState> {
  GetChefMealsCubit({required this.menueRepoImplementation}) : super(GetChefMealsInitial());

  final MenueRepoImplementation menueRepoImplementation;



  List<Meals>? meals=[];

  getChefMeals() async
  {

   final result=await menueRepoImplementation.getAllMeals(id: CacheHelper().getData(key: ApiKeys.id));
   result.fold((error) =>emit(GetChefMealsFailure(errorMessage: error))
       , (mealModel)
       {
         emit(GetChefMealsSuccess(mealModelResponse: mealModel));
         meals=mealModel.meals;
       });

  }


}
