
import 'package:flutter/material.dart';

import '../../../../auth/presentation/widgets/custom_outline_text_field.dart';
import '../../../../auth/presentation/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdatePriceFieldWidget extends StatelessWidget {
  const UpdatePriceFieldWidget({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New Price',
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealPriceController,
          hintText: 'write new meal price here',
          onFieldSubmitted: (value) {

          },
          keyboardType: TextInputType.number,
        ));
  }
}
