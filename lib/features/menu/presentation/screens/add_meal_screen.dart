



import 'package:chef_app/core/widgets/no_meals_widget.dart';
import 'package:chef_app/core/widgets/outlined_text_field.dart';
import 'package:chef_app/features/menu/presentation/viewmodels/cubits/addmealcubit/add_meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/custom_image_picker.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../generated/l10n.dart';

class AddMealScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => AddMealCubit(),
    child: Scaffold(

      appBar: AppBar(
        title: Text(S.of(context).addDishToMenu,style: AppTextStyles.font14.copyWith(color: AppColors.black),),
      ),

        body: SingleChildScrollView(
        child: BlocConsumer<AddMealCubit, AddMealState>(
        listener: (context, state)
        {

        },
        builder: (context, state) {
          final menueCubit=BlocProvider.of<AddMealCubit>(context);
          return Form(
           key: menueCubit.addMealKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: [
                  CustomImagePickerAvatar(
                    imageRadius: 70,
                    plusPaddingRightValue: 15,
                    plusIconRadius: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Column(
                      children:
                      [
                        OutlinedTextField(
                          top: 40,
                          fillColor: AppColors.grey2,
                          borderRadiusValue: 25,
                          textInputType: TextInputType.text,
                          hintText: S.of(context).name,
                          controller: menueCubit.nameController,
                          validator: (value)
                          {
                            if (value!.isEmpty) {
                              return S.of(context).please_enter_name;
                            }
                            return null;
                          },),
                        SizedBox(height: 24,),
                        OutlinedTextField(
                          top: 40,
                          fillColor: AppColors.grey2,
                          borderRadiusValue: 25,
                          textInputType: TextInputType.number,
                          hintText: S.of(context).price,
                          controller: menueCubit.priceController,
                          validator: (value)
                          {
                            if (value!.isEmpty) {
                              return S.of(context).pleaseEnterValidMealPrice;
                            }
                            return null;
                          },),
                        SizedBox(height: 24,),
                        Container(
                         decoration: BoxDecoration(
                           color: AppColors.grey2,
                           borderRadius: BorderRadius.circular(16),
                           border: Border.all(
                             color: AppColors.grey2,
                             width: 2
                           ),
                         ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 20,right: 10),
                            child: DropdownButton(
                                underline: SizedBox(),
                                iconSize: 30,
                                isExpanded: true,
                                value: menueCubit.selectedItem,
                                style: AppTextStyles.font16.copyWith(color: AppColors.grey),
                                hint: Text(S.of(context).category,),
                                items: menueCubit.categoryList.map((e) => DropdownMenuItem(child: Text(e),value: e)).toList(),
                                onChanged: (data)
                            {
                               menueCubit.changeCategoryItem(data);
                            }),
                          ),
                        ),
                        SizedBox(height: 24,),
                        OutlinedTextField(
                          top: 40,
                          fillColor: AppColors.grey2,
                          borderRadiusValue: 25,
                          textInputType: TextInputType.text,
                          hintText: S.of(context).descriptiontextfield,
                          controller: menueCubit.descController,
                          validator: (value)
                          {
                            if (value!.isEmpty) {
                              return S.of(context).pleaseEnterValidMealDesc;
                            }
                            return null;
                          },),
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                 Radio(
                                     value: 'quantity',
                                     groupValue: menueCubit.groupValue,
                                     onChanged: (data)
                                 {
                                   menueCubit.changeRadioValue(data);
                                 }),
                                  Text(S.of(context).number,style: AppTextStyles.font16.copyWith(color: AppColors.black),),
                                ],
                              ),
                              Spacer(),
                              Row(children:
                              [
                                Radio(
                                    value: 'number',
                                    groupValue: menueCubit.groupValue,
                                    onChanged: (data)
                                    {
                                      menueCubit.changeRadioValue(data);
                                    }),
                                Text(S.of(context).quantity,style: AppTextStyles.font16.copyWith(color: AppColors.black),),
                              ],)
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
          
                  SharedButton(
                    text: 'Add Meal',
                    width: 280,
                    height: 60,
                    textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                    buttonColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  )
                ],
              ),
            ),
          ),
        );
  },
),
      ),

    ),
);
  }
}