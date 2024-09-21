
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/commons/global_models/adress_model/AddressComponents.dart';
import 'package:chef_app/core/commons/global_models/adress_model/AddressModel.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/core/utilis/services/get_device_address_service.dart';
import 'package:chef_app/core/utilis/services/internet_connection_service.dart';
import 'package:chef_app/features/home/data/models/all_categories_model/all_categories_model.dart';
import 'package:chef_app/features/home/data/models/get_meals_model/get_all_meals_model.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../data/models/carousel_slider_data_model/carousel_slider_model.dart';
import '../../../data/models/chef_info_model/chef_info_model.dart';
import '../../../data/models/get_meals_model/system_meals.dart';

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
















  List<SystemMeals> favouriteMealsList=[];
  List<SystemMeals> historyMealsList=[];

  changeMealFavouriteShape({required List<SystemMeals> mealList,required int index}) async
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

  removeOngoingFavouriteMeal({required SystemMeals meal,required int index}) async
  {
    homeRepoImplementation.removeOngoingFavouriteMeal(index: index);
    favouriteMealsList.remove(meal);
    emit(GetCachedFavouriteMealsSuccessState());
  }

  addToHistoryFavouriteMeal({required SystemMeals meal,required int index}) async
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

