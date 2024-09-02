

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../auth/presentation/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';

class AddMealPriceTextField extends StatelessWidget {
  const AddMealPriceTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Meal Price',
        childWidget: CustomOutlineTextField(
          controller: AddMealCubit.get(context).mealPriceController,
          hintText: 'write meal price here',
          onFieldSubmitted: (value) {

          },
          validator: (value) {
            if(value!.isEmpty)
            {
              return 'please enter meal price';
            }
            else
            {
              return null;
            }
          },
          keyboardType: TextInputType.number,
        ));
  }
}
