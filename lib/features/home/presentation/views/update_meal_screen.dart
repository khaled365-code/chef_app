import 'package:chef_app/features/home/presentation/cubits/update_meal_cubit/update_meal_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../auth/presentation/widgets/custom_outline_text_field.dart';
import '../../../auth/presentation/widgets/name_and_text_field_widget.dart';
import '../../data/models/get_meals_model/meals.dart';
import '../widgets/add_meal_photo_widget.dart';


class UpdateMealScreen extends StatelessWidget {
  const UpdateMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var updateMealCubit = BlocProvider.of<UpdateMealCubit>(context);
    var receivedMeal=ModalRoute.of(context)!.settings.arguments as Meals;
    return BlocConsumer<UpdateMealCubit, UpdateMealState>(
      listener: (context, state) {
       if(state is UpdateMealSuccessState)
         {
           buildScaffoldMessenger(context: context, msg: 'Meal updated successfully');
           navigate(context: context, route: Routes.homeScreen);
         }
       if(state is UpdateMealFailureState)
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
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 24.w, end: 24.w), child: Column(
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
                        AddMealPhotoWidget(
                           specificUpdateText: 'Update',
                          onDeletePhotoPressed: () {
                            updateMealCubit.deleteUpdatedMealImageFun();
                          },
                          imagePath: updateMealCubit.updatedMealImage?.path,
                          onCameraTap: () {
                            imagePick(imageSource: ImageSource.camera).then(
                                  (value) =>
                                  updateMealCubit.updateMealImageFun(image: value!),
                            );
                            Navigator.pop(context);
                          },
                          onGalleryTap: () {
                            imagePick(imageSource: ImageSource.gallery).then(
                                  (value) =>
                                      updateMealCubit.updateMealImageFun(image: value!),
                            );
                            Navigator.pop(context);
                          },
                        ),
                        SpaceWidget(
                          height: updateMealCubit.updatedMealImage == null ? 24 : 5,),
                         NameAndTextFieldWidget(
                            title: 'New Name',
                            childWidget: CustomOutlineTextField(
                              controller: updateMealCubit.updateMealNameController,
                              hintText: 'write new meal name here',
                              onFieldSubmitted: (value)
                              {

                              },
                              keyboardType: TextInputType.text,
                            )),
                        SpaceWidget(height: 24,),
                        NameAndTextFieldWidget(
                            title: 'New Price',
                            childWidget: CustomOutlineTextField(
                              controller: updateMealCubit.updateMealPriceController,
                              hintText: 'write new meal price here',
                              onFieldSubmitted: (value) {

                              },
                              keyboardType: TextInputType.number,
                            )),
                        SpaceWidget(height: 24,),
                        NameAndTextFieldWidget(
                            title: 'New Description',
                            childWidget: CustomOutlineTextField(
                              controller: updateMealCubit.updateMealDescriptionController,
                              hintText: 'write new meal description here',
                              onFieldSubmitted: (value) {

                              },
                              keyboardType: TextInputType.text,
                            )),
                        SpaceWidget(height: 24,),
                        NameAndTextFieldWidget(
                            title: 'New category',
                            childWidget: Container(
                              decoration: BoxDecoration(
                                color: AppColors.cF0F5FA,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton(
                                      items: updateMealCubit.categoriesList.map(
                                            (e) =>
                                            DropdownMenuItem(
                                                value: e, child: Text(e,
                                              style: AppTextStyles.regular14(
                                                  context).copyWith(
                                                  color: AppColors.cA0A5BA
                                              ),)),
                                      ).toList(),
                                      onChanged: (value)
                                      {
                                        updateMealCubit.changeCategoryValue(value: value.toString());
                                      },
                                      icon: SvgPicture.asset(
                                          ImageConstants.underArrowIcon),
                                      value: updateMealCubit.selectedCategory,
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
                      ],
                    ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Expanded(child: SizedBox(
                          height: 121.h,
                        )),
                        state is UpdateMealLoadingState ?
                        Center(
                          child: SizedBox(
                              width: 30.w,
                              height: 30.w,
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                                strokeWidth: 2.w,

                              )),
                        ) :
                        SharedButton(btnText: 'Update This Meal',
                          btnTextStyle: AppTextStyles.bold16(context)
                              .copyWith(
                              color: AppColors.white
                          ),
                          onPressessed: () async
                          {
                            if( updateMealCubit.updatedMealImage == null &&
                                updateMealCubit.updateMealNameController.text == ''
                                && updateMealCubit.updateMealDescriptionController.text == ''
                                && updateMealCubit.updateMealPriceController.text == ''
                                && updateMealCubit.selectedCategory == 'Beef')
                              {
                                showToast(msg: 'Nothing to update', toastStates: ToastStates.error);
                              }
                            else
                              {
                                if(updateMealCubit.updatedMealImage == null)
                                  {
                                    showToast(msg: 'You must provide an image', toastStates: ToastStates.error);
                                  }
                                else
                                  {
                                    updateMealCubit.updateMealFun(
                                        mealId: receivedMeal.id!,
                                        name: updateMealCubit.updateMealNameController.text==''?receivedMeal.name: updateMealCubit.updateMealNameController.text,
                                        price: updateMealCubit.updateMealPriceController.text!=''?double.parse(updateMealCubit.updateMealPriceController.text):double.parse(receivedMeal.price.toString()),
                                        description: updateMealCubit.updateMealDescriptionController.text==''?receivedMeal.description: updateMealCubit.updateMealDescriptionController.text,
                                        category: updateMealCubit.selectedCategory);

                                  }

                              }
                          },),
                        SpaceWidget(height: 30,)

                      ],
                    ),
                  )

                ],
              )),
        );
      },
    );
  }
}
