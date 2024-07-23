import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_language_state.dart';

class ChangeLanguageAndThemeCubit extends Cubit<ChangeLanguageAndThemeState> {
  ChangeLanguageAndThemeCubit() : super(ChangeLanguageInitial());



  String currentAppLanguage='en';


  changeCurrentAppLanguage({required String languageCode})
  {
       currentAppLanguage=languageCode;
        CacheHelper().saveData(key: ApiKeys.appCurrentLanguage, value: languageCode);
        emit(ChangeLanguageToAnotherState());
  }

  ThemeData currentTheme=ThemeData.light();


  changeCurrentTheme({required bool darkModeIsActive})
  {
    if(darkModeIsActive==true)
    {
      currentTheme=ThemeData.dark();
      CacheHelper().saveData(key: ApiKeys.darkModeIsActive,value: darkModeIsActive);
      emit(ChangeThemeToAnotherState());
    }
    else{
      currentTheme=ThemeData.light();
      CacheHelper().saveData(key: ApiKeys.darkModeIsActive,value: darkModeIsActive);
      emit(ChangeThemeToAnotherState());
    }


  }

}
