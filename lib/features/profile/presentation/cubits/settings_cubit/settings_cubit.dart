import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/api/api_keys.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());





  bool isDarkModeActive=false;





  onDarkModeSwitched({required bool value})
  {
    if(isDarkModeActive==value)
      {
        return;
      }
    else
      {
        isDarkModeActive=value;
        CacheHelper().saveData(key: ApiKeys.darkModeIsActive, value: value);
        emit(DarkModeSwitchedState());
      }

  }



  bool locationIsActive=false;

  void onLocationSwitched({required bool value})
  {
      locationIsActive=value;
      CacheHelper().saveData(key: ApiKeys.locationIsActive, value: value);
      emit(LocationSwitchedState());


  }


  bool notificationIsActive=true;

  void onNotificationSwitched({required bool value})
  {
        notificationIsActive=value;
        CacheHelper().saveData(key: ApiKeys.notificationIsActive, value: value);
        emit(NotificationSwitchedState());


  }


}
