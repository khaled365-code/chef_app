

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';

class AddMealNameTextField extends StatelessWidget {
  const AddMealNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Meal Name',
        childWidget: CustomOutlineTextField(
          controller: AddMealCubit.get(context).mealNameController,
          hintText: 'write meal name here',
          onFieldSubmitted: (value) {

          },
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'please enter meal name';
            }
            if(value==' ')
              {
                return 'please enter meal name';
              }
            else
            {
              return null;
            }
          },
          keyboardType: TextInputType.text,
        ));
  }
}
