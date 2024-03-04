import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'delete_meal_state.dart';

class DeleteMealCubit extends Cubit<DeleteMealState> {
  DeleteMealCubit({required this.menueRepoImplementation}) : super(DeleteMealInitial());

  final MenueRepoImplementation menueRepoImplementation;


  deleteMeal(dynamic id) async
  {
    final result =await menueRepoImplementation.deleteMeals(id: id);

    result.fold((error) => emit(DeleteMealFailureState(errorMessage: error))
        , (success) => emit(DeleteMealSuccessState(succesMessage: success)));

  }

}
