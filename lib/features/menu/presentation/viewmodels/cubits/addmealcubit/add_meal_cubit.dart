import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealInitial());


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
}
