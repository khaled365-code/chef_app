
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chef_app/core/commons/global_models/adress_model/AddressComponents.dart';
import 'package:chef_app/core/commons/global_models/adress_model/AddressModel.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/utilis/services/get_device_address_service.dart';
import 'package:chef_app/features/home/data/models/all_categories_model/all_categories_model.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/get_all_meals_model.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../data/models/carousel_slider_data_model/carousel_slider_model.dart';
import '../../../data/models/chef_info_model/chef_info_model.dart';
import '../../../data/models/get_meals_model/meals.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({required this.homeRepoImplementation}) : super(HomeScreenInitial());

  static HomeScreenCubit get(context)=>BlocProvider.of(context);
  final HomeRepoImplementation homeRepoImplementation;

  getChefDataFun({required String chefIId}) async
  {
    emit(GetChefDataLoadingState());
    final response=await homeRepoImplementation.getChefData(chefIId: chefIId);

    response.fold(
            (errorModel) => emit(GetChefDataErrorState(errorModel: errorModel)),
            (chefInfoModel) => emit(GetChefDataSuccessState(chefInfoModel: chefInfoModel )));

  }



  List<CarouselSliderModel> carouselSliderList=[
    CarouselSliderModel(textTitle: 'Become a Culinary Mastermind,Create and share your signature dishes with the app\'s community! Add mouthwatering meals with detailed descriptions, so users can discover your culinary creations.', btnText: 'See meals'),
    CarouselSliderModel(textTitle: 'Craft Your Culinary Identity: Edit and update your chef profile whenever you like. Add a captivating photo, write a compelling bio, and highlight your culinary expertise to impress the app\'s foodie community.', btnText: 'See your profile'),
  ];

  GlobalKey<RefreshIndicatorState>refreshIndicatorKey=GlobalKey();



  List<AllCategoriesModel> allCategoriesList=[
      AllCategoriesModel(name: 'Beef', image: ImageConstants.beefImage),
      AllCategoriesModel(name: 'Chicken', image: ImageConstants.chickenImage),
      AllCategoriesModel(name: 'Fish', image: ImageConstants.fishImage),
      AllCategoriesModel(name: 'Seafood', image: ImageConstants.seafoodImage),
      AllCategoriesModel(name: 'Pork', image: ImageConstants.porkImage),
      AllCategoriesModel(name: 'Lamb', image: ImageConstants.lambImage),
      AllCategoriesModel(name: 'Vegetarian', image: ImageConstants.vegetarianImage),
      AllCategoriesModel(name: 'Vegan', image: ImageConstants.veganImage),
      AllCategoriesModel(name: 'Gluten-free', image: ImageConstants.glutenFreeImage),
      AllCategoriesModel(name: 'Dairy-free', image: ImageConstants.dairlyFreeImage),
      AllCategoriesModel(name: 'Breakfast', image: ImageConstants.breakfastImage),
      AllCategoriesModel(name: 'Lunch', image: ImageConstants.lunchImage),
      AllCategoriesModel(name: 'Dinner', image: ImageConstants.dinnerImage),
      AllCategoriesModel(name: 'Appetizers', image: ImageConstants.appetizaresImage),
      AllCategoriesModel(name: 'Salads', image: ImageConstants.saladsImage),
      AllCategoriesModel(name: 'Soups', image: ImageConstants.soupImage),
      AllCategoriesModel(name: 'Sandwiches', image: ImageConstants.sandwichesImage),
      AllCategoriesModel(name: 'Pasta', image: ImageConstants.pastaImage),
      AllCategoriesModel(name: 'Pizza', image: ImageConstants.pizzaImage),
      AllCategoriesModel(name: 'Rice dishes', image: ImageConstants.riceDishesImage),
      AllCategoriesModel(name: 'Stir-fries', image: ImageConstants.stirFriesImage),
      AllCategoriesModel(name: 'Curries', image: ImageConstants.curriesImage),
      AllCategoriesModel(name: 'Desserts', image: ImageConstants.dessertsImage),
      AllCategoriesModel(name: 'Baked goods', image: ImageConstants.bakedGoodsImage),
      AllCategoriesModel(name: 'Snacks', image: ImageConstants.snacksImage),

    ];

    int currentSelectedCategoryIndex=0;
    changeCurrentSelectedCategoryPosition({required int index})
    {
      currentSelectedCategoryIndex=index;
      emit(ChangeCurrentSelectedCategoryPositionState());
    }


    // get meals fun
    Future<void> getAllMealsFun() async
    {
      emit(GetAllMealsLoadingState());
      final response=await homeRepoImplementation.getAllMeals();
      emit(getStateAfterRequest(response));
    }


  GetAllMealsModel? allMealsModel;

  HomeScreenState getStateAfterRequest(Either<ErrorModel, GetAllMealsModel> response)
  {
    return response.fold((errorModel)
    {
      return GetAllMealsFailureState(errorModel: errorModel);
    }, (getAllMealsModel)
    {
      allMealsModel=getAllMealsModel;
      return GetAllMealsSuccessState(getAllMealsModel: getAllMealsModel);
    });

  }








  List<Meals> favouriteMealsList=[];
  List<Meals> historyMealsList=[];

  changeMealFavouriteShape({required List<Meals> mealList,required int index}) async
  {
    mealList[index].itemIsSelected=!mealList[index].itemIsSelected;
    if(mealList[index].itemIsSelected==true)
    {
      await homeRepoImplementation.saveCachedFavouriteMeals(meal: mealList[index]);

    }
    emit(ChangeMealFavouriteActiveShapeState());

  }


  void getCachedFavouriteMeals()
  {
    final response= homeRepoImplementation.getCachedFavouriteMeals( );
    response.fold((exception)
    {
      emit(GetCachedFavouriteMealsFailureState(errorMessage: exception.toString()));
    } , (success)
    {
      favouriteMealsList=success;
      emit(GetCachedFavouriteMealsSuccessState());
    },);

  }


  void getCachedHistoryMeals()
  {
    final response= homeRepoImplementation.getCachedHistoryMeals();
    response.fold((exception)
    {
      emit(GetCachedHistoryMealsFailureState(errorMessage: exception.toString()));
    } , (success)
    {
      historyMealsList=success;
      emit(GetCachedHistoryMealsSuccessState(historyMealsList: success));
    },);

  }

  removeOngoingFavouriteMeal({required Meals meal,required int index}) async
  {
    homeRepoImplementation.removeOngoingFavouriteMeal(index: index);
    favouriteMealsList.remove(meal);
    emit(GetCachedFavouriteMealsSuccessState());
  }

  addToHistoryFavouriteMeal({required Meals meal,required int index}) async
  {
    removeOngoingFavouriteMeal(meal: meal,index:index);
    await homeRepoImplementation.saveCachedHistoryMeals(meal: meal);
    emit(GetCachedFavouriteMealsSuccessState());
  }


  saveLocalNotificationsFun({required LocalNotificationsModel localNotification}) async
  {
    await homeRepoImplementation.saveLocalNotification(localNotification: localNotification);
  }

  List<LocalNotificationsModel> localNotificationsList=[];
  getAllCachedNotificationsFun()
  {
    final response= homeRepoImplementation.getCachedLocalNotifications();

    response.fold((exception)
    {
      emit(GetLocalNotificationsFailureState(errorMessage: exception.toString()));
    } , (success)
    {
      localNotificationsList=success;
      emit(GetLocalNotificationsSuccessState());
    },);
  }

  deleteSpecificNotification({required int localNotificationId,required int index}) async
  {
    homeRepoImplementation.deleteNotification(localNotificationId: localNotificationId, index: index);
    localNotificationsList.removeAt(index);
    emit(GetLocalNotificationsSuccessState());

  }

  clearAllLocalNotifications() async
  {
    await homeRepoImplementation.clearAllNotifications();
    localNotificationsList.clear();
    emit(GetLocalNotificationsSuccessState());

  }

  // bool locationIsActive=false;
  // Future<void> onLocationSwitched({required bool value}) async
  // {
  //   locationIsActive=value;
  //   await CacheHelper().saveData(key: ApiKeys.locationIsActive, value: value);
  //   emit(LocationSwitchedState());
  //
  //   if(locationIsActive==false)
  //   {
  //     userAddress='';
  //   }
  //   else
  //     {
  //       getUserAddressFun();
  //     }
  // }

  String userAddress='';

  getUserAddressFun() async
  {
    AddressModel addressModel = await DeviceAddressService.getAppAddress();
      List<AddressComponents> addressComponentsList=addressModel.results![0].addressComponents!;
      for(var item in addressComponentsList)
      {
        userAddress+="${item.longName},";
      }
  }




}

