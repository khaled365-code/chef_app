


import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class PushNotificationsService
{

  static FirebaseMessaging fireMessaging=FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  static Future<void> init() async
  {
    await fireMessaging.requestPermission();
    await getDeviceToken();
    FirebaseMessaging.onBackgroundMessage(handler);
    FirebaseMessaging.onMessage.listen(onForegroundMessage);
    await fireMessaging.subscribeToTopic('Your_Meals');
  }

  static void onForegroundMessage(RemoteMessage message)
  {
    showForegroundNotification(remoteMessage: message);
  }
  static  Future<void> handler(RemoteMessage message) async
  {
    await Firebase.initializeApp();
  }

  static Future<void> getDeviceToken() async
  {
    String? token=await fireMessaging.getToken();
    log(token.toString());
  }

 static  Future<void> showForegroundNotification({required RemoteMessage remoteMessage}) async
  {
    var bigPictureStyleInformation = await handleImageForForegroundNotification(remoteMessage);
    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
          '4',
          'basic foreground pushed notification',
          playSound: true,
          priority: Priority.max,
          importance: Importance.high,
          styleInformation: bigPictureStyleInformation!=''?bigPictureStyleInformation:null
        ),
        iOS: DarwinNotificationDetails()
    );
    await flutterLocalNotificationsPlugin.show(
        remoteMessage.notification.hashCode,
        remoteMessage.notification!.title,
        remoteMessage.notification!.body,
        notificationDetails);

  }

 static Future<dynamic> handleImageForForegroundNotification(RemoteMessage remoteMessage) async
 {
   if(remoteMessage.data['image']!=null)
   {
     final http.Response image = await http.get(Uri.parse(remoteMessage.notification?.android?.imageUrl??''));
     var bigPictureStyleInformation = BigPictureStyleInformation(
       ByteArrayAndroidBitmap.fromBase64String(
         base64Encode(image.bodyBytes),
       ),
     );
     return bigPictureStyleInformation;
   }
   return '';
 }






}