import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeLanguageInitial());


  static ChangeThemeCubit get(context) => BlocProvider.of(context);


  ThemeData currentTheme=ThemeData.light();


  Future<void> changeCurrentTheme({required bool darkModeIsActive}) async
  {
    if(darkModeIsActive==true)
    {
      currentTheme=ThemeData.dark();
      await CacheHelper().saveData(key: ApiKeys.darkModeIsActive,value: darkModeIsActive);
      emit(ChangeThemeToAnotherState());
    }
    else{
      currentTheme=ThemeData.light();
      await CacheHelper().saveData(key: ApiKeys.darkModeIsActive,value: darkModeIsActive);
      emit(ChangeThemeToAnotherState());
    }


  }

}
