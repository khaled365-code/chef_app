

import 'package:flutter/material.dart';

import '../../../../auth/presentation/widgets/custom_outline_text_field.dart';
import '../../../../auth/presentation/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdateMealNameFieldWidget extends StatelessWidget {
  const UpdateMealNameFieldWidget({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New Name',
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealNameController,
          hintText: 'write new meal name here',
          onFieldSubmitted: (value)
          {

          },
          keyboardType: TextInputType.text,
        ));
  }
}