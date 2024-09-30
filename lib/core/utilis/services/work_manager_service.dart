


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class WorkManagerService
{
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
   static Workmanager workManager=Workmanager();


  static Future<void> init() async
  {
    await workManager.initialize(actionTask,isInDebugMode: true,);
    await registerTask();

  }



  static Future<void> registerTask() async
  {
    await workManager.registerPeriodicTask(
      'periodic scheduled notification id 10',
      'periodic scheduled notification task',
      frequency: Duration(hours: 12),
    );
  }


 static Future<void> showDailyScheduledNotification() async
  {
    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
            '7',
            'periodic daily scheduled notification',
            importance: Importance.max,
            priority: Priority.high,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('meal_time_app_notification'),
        ),
        iOS: DarwinNotificationDetails()
    );
    UILocalNotificationDateInterpretation uiLocalNotificationDateInterpretation=UILocalNotificationDateInterpretation.absoluteTime;
     await setCurrentDeviceLocation();
    // كل يوم الساعه 12 يكون فيه scheduled Notification very important
    var currentTime=tz.TZDateTime.now(tz.local);
    var scheduledTime= tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      24,
    );
    if(scheduledTime.isBefore(currentTime))
    {
      scheduledTime=scheduledTime.add(Duration(days: 1));
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        10,
        'Time for a Tasty Treat!',
        'Discover new meals added today! Check out the latest recipes from our chefs or add your own to the collection',
        scheduledTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation,
       // matchDateTimeComponents: DateTimeComponents.time,  // Ensures it fires daily at the same time

    );
  }


  static Future<void> setCurrentDeviceLocation() async
  {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  static Future<void> cancelTask({required String uniqueName}) async
  {
    await workManager.cancelByUniqueName(uniqueName);
  }

  static Future<void> cancelAllTasks() async
  {
    await workManager.cancelAll();
  }

}


@pragma('vm:entry-point')
 actionTask()
{
  Workmanager().executeTask((taskName, inputData) async
  {
    await WorkManagerService.showDailyScheduledNotification();
    return Future.value(true);
  },);
}