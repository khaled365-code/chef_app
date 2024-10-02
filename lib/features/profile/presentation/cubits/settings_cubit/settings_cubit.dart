import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/utilis/services/push_notifications_service.dart';
import 'package:chef_app/core/utilis/services/work_manager_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/utilis/services/internet_connection_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context)=>BlocProvider.of(context);



  bool isBillReminderActive=true;

  Future<void> onBillReminderSwitched({required bool value}) async
  {
        isBillReminderActive=value;
        await CacheHelper().saveData(key: ApiKeys.billReminderIsActive, value: value);
        emit(BillReminderSwitchedState());
        if(isBillReminderActive==true)
          {
            WorkManagerService.init();
          }
        else
          {
            WorkManagerService.cancelTask(uniqueName: 'periodic scheduled notification id 10');
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
             PushNotificationsService.disablePushNotifications(),
             PushNotificationsService.unSubscribeToTopicFun(),
            ]);
          }
        else
          {
            if (await InternetConnectionCheckingService.checkInternetConnection() == true)
            {
              await PushNotificationsService.init();
            }
          }

  }

  bool appUpdateIsActive=true;

  switchOnAppUpdatesFun({required bool value}) async
  {
    if(appUpdateIsActive==value)
      {
        return;
      }
    else
      {
        appUpdateIsActive=value;
        await CacheHelper().saveData(key: ApiKeys.appUpdateIsActive, value: value);
        emit(AppUpdatesSwitchedState());
      }

  }


}

