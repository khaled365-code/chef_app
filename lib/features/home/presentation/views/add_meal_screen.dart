import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_outline_text_field.dart';
import 'package:chef_app/features/auth/presentation/widgets/name_and_text_field_widget.dart';
import 'package:chef_app/features/home/presentation/cubits/add_meal_cubit/add_meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/radio_button_with_text_widget.dart';
import '../widgets/update_meal/add_meal_photo_widget.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocListener<AddMealCubit, AddMealState>(
        listener: (context, state) {
       {
         if(state is AddMealSuccessState)
        {
        buildScaffoldMessenger(context: context, msg: state.addMealModel.message!);
        AddMealCubit.get(context).mealImage=null;
        AddMealCubit.get(context).mealNameController.clear();
        AddMealCubit.get(context).mealDescriptionController.clear();
        AddMealCubit.get(context).mealPriceController.clear();
        navigate(context: context, route: Routes.homeScreen);
        }
      if(state is AddMealFailureState)
      {

        if(state.errorModel.error!=null)
        {
          buildScaffoldMessenger(context: context, msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1));
        }
        else
        {
          buildScaffoldMessenger(context: context, msg: state.errorModel.errorMessage!);
        }
      }
    }
  }, child: Scaffold(
          body: SafeArea(
              child: Form(
                key: AddMealCubit.get(context).addMealFormKey,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 24.w, end: 24.w),                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceWidget(height: 24,),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.cECF0F4
                                ),
                                child: Center(child: SvgPicture.asset(
                                    ImageConstants.arrowBackIcon)),
                              ),
                            ),
                            SpaceWidget(height: 24,),
                            BlocBuilder<AddMealCubit,AddMealState>(
                              builder: (context, state) => AddMealPhotoWidget(
                                onDeletePhotoPressed: ()
                                {
                                  AddMealCubit.get(context).deleteMealPhoto();
                                },
                                imagePath: AddMealCubit.get(context).mealImage?.path,
                                onCameraTap: ()
                                {
                                  imagePick(imageSource: ImageSource.camera).then(
                                        (value) => AddMealCubit.get(context).addMealPhoto(image: value!),
                                  );
                                  Navigator.pop(context);
                                },
                                onGalleryTap: ()
                                {
                                  imagePick(imageSource: ImageSource.gallery).then(
                                        (value) => AddMealCubit.get(context).addMealPhoto(image: value!),
                                  );
                                  Navigator.pop(context);

                                },
                              ),
                            ),
                            SpaceWidget(height: AddMealCubit.get(context).mealImage == null ? 24 : 5,),
                            NameAndTextFieldWidget(
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
                                    else
                                      {
                                        return null;
                                      }
                                  },
                                  keyboardType: TextInputType.text,
                                )),
                            SpaceWidget(height: 24,),
                            NameAndTextFieldWidget(
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
                                )),
                            SpaceWidget(height: 24,),
                            NameAndTextFieldWidget(
                                title: 'Meal Description',
                                childWidget: CustomOutlineTextField(
                                  controller: AddMealCubit.get(context).mealDescriptionController,
                                  hintText: 'write meal description here',
                                  onFieldSubmitted: (value) {

                                  },
                                  validator: (value) {
                                    if(value!.isEmpty)
                                    {
                                      return 'please enter meal description';
                                    }
                                    else
                                    {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                )),
                            SpaceWidget(height: 24,),
                            NameAndTextFieldWidget(
                                title: 'Meal category',
                                childWidget: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.cF0F5FA,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButton(
                                            items: AddMealCubit.get(context).categoriesList.map(
                                              (e) => DropdownMenuItem(
                                                  value: e, child: Text(e,
                                              style: AppTextStyles.regular14(context).copyWith(
                                                color: AppColors.cA0A5BA
                                              ),)),
                                            ).toList(),
                                          onChanged: (value) {
                                            AddMealCubit.get(context).changeCategoryValue(value: value!);
                                          },
                                          icon: SvgPicture.asset(ImageConstants.underArrowIcon),
                                          value: AddMealCubit.get(context).selectedCategory,
                                          isExpanded: true,
                                          dropdownColor: AppColors.cF0F5FA,
                                          elevation: 0,
                                          underline: SizedBox.shrink(),
                                          padding: EdgeInsetsDirectional.only(
                                            start: 19.w,
                                            end: 16.w
                                          ),),

                                      ),
                                    ],
                                  ),
                                )),
                            SpaceWidget(height: 24,),
                            BlocBuilder<AddMealCubit,AddMealState>(
                              builder: (context, state) => Row(
                                children: [
                                  GestureDetector(
                                    onTap: ()
                                    {
                                      AddMealCubit.get(context).changeNumberRadioValue();
                                    },
                                    child: RadioButtonWithTextWidget(
                                      text: 'Number',
                                      containerIsSelected: AddMealCubit.get(context).numberRadioIsSelected,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: ()
                                    {
                                      AddMealCubit.get(context).changeQuantityRadioValue();
                                    },
                                    child: RadioButtonWithTextWidget(
                                      text: 'Quantity',
                                      containerIsSelected: AddMealCubit.get(context).quantityRadioIsSelected,
                                    ),
                                  )

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 121.h,
                          )),
                          BlocBuilder<AddMealCubit,AddMealState>(
                            builder: (context, state) {
                              if(state is AddMealLoadingState )
                                {
                                  return Center(
                                    child: SizedBox(
                                        width: 30.w,
                                        height: 30.w,
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                          strokeWidth: 2.w,

                                        )),
                                  );
                                }
                              else
                                {
                                  return SharedButton(
                                    btnText: 'Add Meal',
                                    btnTextStyle: AppTextStyles.bold16(context).copyWith(
                                        color: AppColors.white
                                    ),
                                    onPressessed: ()
                                    {
                                      if (AddMealCubit.get(context).addMealFormKey.currentState!.validate())
                                      {
                                        AddMealCubit.get(context).addMealFun(
                                          name: AddMealCubit.get(context).mealNameController.text,
                                          description: AddMealCubit.get(context).mealDescriptionController.text,
                                          price: double.parse(AddMealCubit.get(context).mealPriceController.text),
                                          category: AddMealCubit.get(context).selectedCategory,
                                          howToSell: getHowToSellValue(numberValue: AddMealCubit.get(context).numberRadioIsSelected,quantityValue: AddMealCubit.get(context).quantityRadioIsSelected),);
                                      }

                                    },);
                                }
                            },
                          ),
                          SpaceWidget(height: 30,)

                        ],
                      ),
                    )

                  ],
                ),
              )),
        ),
);
  }

  getHowToSellValue({required bool numberValue,required bool quantityValue})
  {
    if(numberValue==true)
    {
      return 'number';
    }
    else if(quantityValue==true)
    {
      return 'quantity';
    }
  }
}
