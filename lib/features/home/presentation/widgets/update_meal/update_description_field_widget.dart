

import 'package:flutter/material.dart';

import '../../../../auth/presentation/widgets/custom_outline_text_field.dart';
import '../../../../auth/presentation/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdateDescriptionFieldWidget extends StatelessWidget {
  const UpdateDescriptionFieldWidget({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New Description',
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealDescriptionController,
          hintText: 'write new meal description here',
          onFieldSubmitted: (value) {

          },
          keyboardType: TextInputType.text,
        ));
  }
}
