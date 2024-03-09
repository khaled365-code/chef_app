



import 'dart:io';

import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/widgets/no_meals_widget.dart';
import 'package:chef_app/core/widgets/outlined_text_field.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo_implementation.dart';
import 'package:chef_app/features/menu/presentation/viewmodels/cubits/addmealcubit/add_meal_cubit.dart';
import 'package:chef_app/features/menu/presentation/viewmodels/cubits/menue_cubit/menue_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/utilis/commons.dart';
import '../../../../core/widgets/custom_image_picker.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../generated/l10n.dart';

class AddMealScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
    create: (context) => AddMealCubit(menueRepoImplementation: MenueRepoImplementation(api: DioConsumer(dio: Dio()))),
),
    BlocProvider(
      create: (context) => MenueCubit(menueRepoImplementation: MenueRepoImplementation(api: DioConsumer(dio: Dio()))),
    ),
  ],
  child: Scaffold(

      appBar: AppBar(
        title: Text(S.of(context).addDishToMenu,style: AppTextStyles.font14.copyWith(color: AppColors.black),),
      ),

        body: SingleChildScrollView(
        child: BlocConsumer<AddMealCubit, AddMealState>(
        listener: (context, state)
        {
          if(state is AddMealSuccessState)
            {
              showToast(toastStates: ToastStates.success,msg: S.of(context).mealAddedSucessfully);
              BlocProvider.of<MenueCubit>(context).getAllMeals();
              Navigator.pop(context);
            }
          else if(state is AddMealFailureState)
          {
            showToast(toastStates: ToastStates.success,msg: S.of(context).mealNotAddedSucessfully);
          }

        },
        builder: (context, state) {
          final addMealCubit=BlocProvider.of<AddMealCubit>(context);
          return Form(
           key: addMealCubit.addMealKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: [
                    addMealCubit.image==null ?  CustomImagePickerAvatar(
                    imageRadius: 70,
                    plusPaddingRightValue: 15,
                    plusIconRadius: 15,
                    cameraOnTap: ()
                    {
                     imagePick(imageSource: ImageSource.camera).then((value) => addMealCubit.image=value);
                      Navigator.pop(context);
                    },
                    galleryOnTap: ()
                    {
                      imagePick(imageSource: ImageSource.gallery).then((value) => addMealCubit.image=value);
                      Navigator.pop(context);

                    },
                  ):
                  CircleAvatar(
                    backgroundImage: FileImage(File(addMealCubit.image!.path)),
                    radius: 40,
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
                          controller: addMealCubit.nameController,
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
                          controller: addMealCubit.priceController,
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
                             color: AppColors.white,
                             width: 2
                           ),
                         ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 20,right: 10),
                            child: DropdownButton(
                                underline: SizedBox(),
                                iconSize: 30,
                                isExpanded: true,
                                value: addMealCubit.selectedItem,
                                style: AppTextStyles.font16.copyWith(color: AppColors.grey),
                                hint: Text(S.of(context).category,),
                                items: addMealCubit.categoryList.map((e) => DropdownMenuItem(child: Text(e),value: e)).toList(),
                                onChanged: (data)
                            {
                            addMealCubit.changeCategoryItem(data);
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
                          controller: addMealCubit.descController,
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
                                     groupValue: addMealCubit.groupValue,
                                     onChanged: (data)
                                 {
                                 addMealCubit.changeRadioValue(data);
                                 }),
                                  Text(S.of(context).number,style: AppTextStyles.font16.copyWith(color: AppColors.black),),
                                ],
                              ),
                              Spacer(),
                              Row(children:
                              [
                                Radio(
                                    value: 'number',
                                    groupValue: addMealCubit.groupValue,
                                    onChanged: (data)
                                    {
                                    addMealCubit.changeRadioValue(data);
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
          
                  state is AddMealLoadingState ? CustomProgressIndicator(): SharedButton(
                    onPressed: ()
                    {
                      if(addMealCubit.addMealKey.currentState!.validate())
                        {
                          print("this is the token ${CacheHelper().getData(key: ApiKeys.token)}");
                          addMealCubit.addMeal();
                        }
                    },
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