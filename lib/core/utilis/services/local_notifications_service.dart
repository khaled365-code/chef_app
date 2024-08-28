
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import '../../commons/global_models/local_notifications_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../commons/global_models/scheduled_notification_model.dart';



class LocalNotificationsService
{

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  static init() async
  {
   await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings(
          '@mipmap/ic_launcher'
        ),
        iOS: DarwinInitializationSettings()
      )
    );
  }


  static Future<void> showBasicNotification({required LocalNotificationsModel localNotificationsModel}) async
  {

    NotificationDetails notificationDetails=NotificationDetails(
      android: AndroidNotificationDetails(
          '1',
          'basic notification',
           playSound: true,
        priority: Priority.max,
        importance: Importance.high,
        sound: RawResourceAndroidNotificationSound(localNotificationsModel.sound),
      ),
      iOS: DarwinNotificationDetails()
    );
    await flutterLocalNotificationsPlugin.show(
        localNotificationsModel.id,
        localNotificationsModel.title,
        localNotificationsModel.body,
        payload: localNotificationsModel.payload,
        notificationDetails);
  }


  static Future<void> showRepeatedNotification({required LocalNotificationsModel localNotificationsModel,required RepeatInterval repeatedInterval}) async
  {
    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
          '2',
          'repeated notification',
          playSound: true,
          priority: Priority.max,
          importance: Importance.high,
          sound: RawResourceAndroidNotificationSound(localNotificationsModel.sound),
        ),
        iOS: DarwinNotificationDetails()
    );
   await  flutterLocalNotificationsPlugin.periodicallyShow(
        localNotificationsModel.id,
        localNotificationsModel.title,
        localNotificationsModel.body,
        repeatedInterval,
        payload: localNotificationsModel.payload,
        notificationDetails);
  }


  static Future<void> showScheduledNotification({required LocalNotificationsModel localNotificationsModel,required ScheduledNotificationModel scheduledNotificationModel})async
  {
    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
          '3',
          'scheduled notification',
          playSound: true,
          priority: Priority.max,
          importance: Importance.high,
          sound: RawResourceAndroidNotificationSound(localNotificationsModel.sound),
        ),
        iOS: DarwinNotificationDetails()
    );
    UILocalNotificationDateInterpretation uiLocalNotificationDateInterpretation
    =UILocalNotificationDateInterpretation.absoluteTime;

    await setCurrentDeviceLocation();
   await flutterLocalNotificationsPlugin.zonedSchedule(
        localNotificationsModel.id,
        localNotificationsModel.title,
        localNotificationsModel.body,
        payload: localNotificationsModel.payload,
        tz.TZDateTime(
        tz.local,
          scheduledNotificationModel.year,
          scheduledNotificationModel.month,
          scheduledNotificationModel.day,
          scheduledNotificationModel.hour,
          scheduledNotificationModel.minute,
          scheduledNotificationModel.second??0,
   ),
        notificationDetails,
        uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation);

  }

  static Future<void> setCurrentDeviceLocation() async {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }


}