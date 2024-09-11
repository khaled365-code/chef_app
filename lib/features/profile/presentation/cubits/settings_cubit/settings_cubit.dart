import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/utilis/services/local_notifications_service.dart';
import 'package:chef_app/core/utilis/services/push_notifications_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/commons/global_models/adress_model/AddressComponents.dart';
import '../../../../../core/commons/global_models/adress_model/AddressModel.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/utilis/services/get_device_address_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());




   static SettingsCubit get(context)=>BlocProvider.of(context);
  bool isDarkModeActive=false;

  Future<void> onDarkModeSwitched({required bool value}) async
  {
    if(isDarkModeActive==value)
      {
        return;
      }
    else
      {
        isDarkModeActive=value;
        await CacheHelper().saveData(key: ApiKeys.darkModeIsActive, value: value);
        emit(DarkModeSwitchedState());
      }

  }




  bool notificationIsActive=true;

  Future<void> onNotificationSwitched({required bool value}) async
  {
        notificationIsActive=value;
        await CacheHelper().saveData(key: ApiKeys.notificationIsActive, value: value);
        emit(NotificationSwitchedState());
        if(notificationIsActive==false)
          {
            await Future.wait([
             LocalNotificationsService.cancelAllNotifications(),
             PushNotificationsService.disablePushNotifications(),
             PushNotificationsService.unSubscribeToTopicFun(),
            ]);
          }
        else
          {
            await Future.wait([
             PushNotificationsService.subscribeToTopicFun(),
              PushNotificationsService.getDeviceToken()
            ]);

          }

  }




}

