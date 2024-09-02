import 'package:chef_app/features/home/presentation/cubits/update_meal_cubit/update_meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../auth/presentation/widgets/name_and_text_field_widget.dart';
import '../../data/models/get_meals_model/meals.dart';
import '../widgets/add_meal_photo_widget.dart';
import '../widgets/update_meal/app_bar_update_screen.dart';
import '../widgets/update_meal/update_description_field_widget.dart';
import '../widgets/update_meal/update_meal_name_widget.dart';
import '../widgets/update_meal/update_price_field_widget.dart';


class UpdateMealScreen extends StatelessWidget {
  const UpdateMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var receivedMeal=ModalRoute.of(context)!.settings.arguments as Meals;
        return BlocListener<UpdateMealCubit,UpdateMealState>(
          listener: (context, state)
          {
            handleUpdateMealFailureFun(state, context);
          },
  child: Scaffold(
          body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(padding: EdgeInsetsDirectional.only(
                          start: 24.w, end: 24.w),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceWidget(height: 24,),
                        UpdateScreenAppBar(),
                        SpaceWidget(height: 24,),
                        BlocBuilder<UpdateMealCubit, UpdateMealState>
                          (builder: (context, state){
                            return AddMealPhotoWidget(
                            specificUpdateText: 'Update',
                            onDeletePhotoPressed: () {
                              UpdateMealCubit.get(context).deleteUpdatedMealImageFun();
                            },
                            imagePath: UpdateMealCubit.get(context).updatedMealImage?.path,
                            onCameraTap: () {
                              imagePick(imageSource: ImageSource.camera).then(
                                    (value) =>
                                        UpdateMealCubit.get(context).updateMealImageFun(image: value!),
                              );
                              Navigator.pop(context);
                            },
                            onGalleryTap: () {
                              imagePick(imageSource: ImageSource.gallery).then(
                                    (value) =>
                                        UpdateMealCubit.get(context).updateMealImageFun(image: value!),
                              );
                              Navigator.pop(context);
                            },
                          );
                        }),
                         SpaceWidget(height: UpdateMealCubit.get(context).updatedMealImage == null ? 24 : 10,),
                         UpdateMealNameFieldWidget(updateMealCubit: UpdateMealCubit.get(context)),
                        SpaceWidget(height: 24,),
                        UpdatePriceFieldWidget(updateMealCubit: UpdateMealCubit.get(context)),
                        SpaceWidget(height: 24,),
                        UpdateDescriptionFieldWidget(updateMealCubit: UpdateMealCubit.get(context)),
                        SpaceWidget(height: 24,),
                        BlocBuilder<UpdateMealCubit, UpdateMealState>(
                            builder: (context,state){
                              return NameAndTextFieldWidget(
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
                                            items: UpdateMealCubit.get(context).categoriesList.map(
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
                                              UpdateMealCubit.get(context).changeCategoryValue(value: value.toString());
                                            },
                                            icon: SvgPicture.asset(
                                                ImageConstants.underArrowIcon),
                                            value: UpdateMealCubit.get(context).selectedCategory,
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
                                  ));
                            }),
                        SpaceWidget(height: 24,),
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
                        ),),
                        BlocBuilder<UpdateMealCubit, UpdateMealState>(
                            builder: (context,state){
                              if(state is UpdateMealLoadingState)
                                {
                                  return Center(
                                    child: SizedBox(
                                        width: 30.w,
                                        height: 30.w,
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                          strokeWidth: 2.w,

                                        ),),);
                                }
                              else
                                {
                                  return SharedButton(btnText: 'Update This Meal',
                                    btnTextStyle: AppTextStyles.bold16(context)
                                        .copyWith(
                                        color: AppColors.white
                                    ),
                                    onPressessed: () async
                                    {
                                      await updateMealFun(context, receivedMeal);
                                    },);}
                            },),
                        SpaceWidget(height: 30,)

                      ],
                    ),
                  )

                ],
              )),
        ),
);
  }

  void handleUpdateMealFailureFun(UpdateMealState state, BuildContext context) {
     if (state is UpdateMealSuccessState)
    {
      buildScaffoldMessenger(
          context: context, msg: 'Meal updated successfully');
      navigate(context: context, route: Routes.homeScreen);
    }
    if (state is UpdateMealFailureState)
    {
      if (state.errorModel.error != null) {
        buildScaffoldMessenger(context: context,
            msg: state.errorModel.error!.toString().substring(
                1, state.errorModel.error!.toString().length - 1));
      }
      else {
        buildScaffoldMessenger(
            context: context, msg: state.errorModel.errorMessage!);
      }
    }
  }


  Future<void> updateMealFun(BuildContext context, Meals receivedMeal) async {
     if( UpdateMealCubit.get(context).updatedMealImage == null &&
        UpdateMealCubit.get(context).updateMealNameController.text == ''
        && UpdateMealCubit.get(context).updateMealDescriptionController.text == ''
        && UpdateMealCubit.get(context).updateMealPriceController.text == ''
        && UpdateMealCubit.get(context).selectedCategory == 'Beef')
    {
      showToast(msg: 'Nothing to update', toastStates: ToastStates.error,gravity: ToastGravity.CENTER);
    }
    else
    {
        XFile mealImage = await getImageXFileByUrl(receivedMeal.images![0]);
        UpdateMealCubit.get(context).updateMealFun(
            mealId: receivedMeal.id!,
            name: UpdateMealCubit.get(context).updateMealNameController.text==''?receivedMeal.name: UpdateMealCubit.get(context).updateMealNameController.text,
            price: UpdateMealCubit.get(context).updateMealPriceController.text!=''?double.parse(UpdateMealCubit.get(context).updateMealPriceController.text):double.parse(receivedMeal.price.toString()),
            description: UpdateMealCubit.get(context).updateMealDescriptionController.text==''?receivedMeal.description: UpdateMealCubit.get(context).updateMealDescriptionController.text,
            category: UpdateMealCubit.get(context).selectedCategory,
            newMealImage:  UpdateMealCubit.get(context).updatedMealImage==null? mealImage : UpdateMealCubit.get(context).updatedMealImage
        );



    }
  }
}



