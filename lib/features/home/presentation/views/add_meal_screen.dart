import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/no_internet_connection_dialog.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/home/presentation/cubits/add_meal_cubit/add_meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/add_meal/add_category.dart';
import '../widgets/add_meal/add_description.dart';
import '../widgets/add_meal/add_name.dart';
import '../widgets/add_meal/add_price.dart';
import '../widgets/add_meal/number_radio_button.dart';
import '../widgets/add_meal/quantity_radio_button.dart';
import '../widgets/add_meal_photo_widget.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocListener<AddMealCubit, AddMealState>(
        listener: (context, state) {
       {
         handleListenerFunctions(state, context);
    }
  }, child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
              child: Form(
                key: AddMealCubit.get(context).addMealFormKey,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 24.w, end: 24.w),
                        child: Column(
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
                                child: Center(
                                  child: SvgPicture.asset(
                                      width: 10, ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
                                ),
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
                            AddMealNameTextField(),
                            SpaceWidget(height: 24,),
                            AddMealPriceTextField(),
                            SpaceWidget(height: 24,),
                            AddMealDiscTextField(),
                            SpaceWidget(height: 24,),
                            BlocBuilder<AddMealCubit, AddMealState>(
                            builder: (context, state)
                              {
                              return AddMealCategoryWidget();
                              },
                            ),
                            SpaceWidget(height: 24,),
                            BlocBuilder<AddMealCubit,AddMealState>(
                              builder: (context, state) => Row(
                                children: [
                                  NumberRadioButton(),
                                  Spacer(),
                                  QuantityRadioButton()

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
                                    child: SharedLoadingIndicator(),
                                  );
                                }
                              else
                                {
                                  return SharedButton(
                                    btnText: 'Add Meal',
                                    btnTextStyle: AppTextStyles.bold16(context).copyWith(
                                        color: AppColors.white
                                    ),
                                    onPressed: ()
                                    {
                                      handleAddMealPress(context);

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

  void handleAddMealPress(BuildContext context) async
  {
    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        if (AddMealCubit.get(context).addMealFormKey.currentState!.validate())
        {
          if(AddMealCubit.get(context).mealImage==null)
          {
            showToast(msg: 'You must provide image to add meal !', toastStates: ToastStates.error,gravity: ToastGravity.CENTER);
          }
          else
          {
            AddMealCubit.get(context).addMealFun(
              name: AddMealCubit.get(context).mealNameController.text,
              description: AddMealCubit.get(context).mealDescriptionController.text,
              price: double.parse(AddMealCubit.get(context).mealPriceController.text),
              category: AddMealCubit.get(context).selectedCategory,
              howToSell: getHowToSellValue(numberValue: AddMealCubit.get(context).numberRadioIsSelected,quantityValue: AddMealCubit.get(context).quantityRadioIsSelected),);
          }
        }
      }
    else
      {
        showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
      }


  }

  void handleListenerFunctions(AddMealState state, BuildContext context) {
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






