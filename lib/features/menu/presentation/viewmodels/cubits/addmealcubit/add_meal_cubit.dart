import 'package:bloc/bloc.dart';
import 'package:chef_app/features/auth/data/repos/user_repository_implementation.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit({required this.menueRepoImplementation}) : super(AddMealInitial());


  MenueRepoImplementation menueRepoImplementation;


  XFile? image;

  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController descController=TextEditingController();
  GlobalKey<FormState> addMealKey=GlobalKey<FormState>();
  List<String> categoryList=[
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
  ];

  String selectedItem='Beef';

  void changeCategoryItem(item)
  {
    selectedItem=item;
   emit(AddMealCategoryChanged());

  }

  String groupValue='quantity';

  void changeRadioValue(item)
  {
    groupValue=item;
    emit(AddMealRadioValueChanged());

  }

  addMeal() async
  {
    emit(AddMealLoadingState());
    final response = await menueRepoImplementation.addMeal(
        name: nameController.text,
        desc: descController.text,
        price: priceController.text,
        category: selectedItem,
        howToSell: groupValue,
        mealImage: image!);

    response.fold((error) => emit(AddMealFailureState(errorMessage: error))
        , (success) => emit(AddMealSuccessState(succesMessage: success)));
  }

}
