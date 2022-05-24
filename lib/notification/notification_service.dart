
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:yes_demo/firebase_learn/firebase_learn.dart';
import 'package:yes_demo/helpers/colors.dart';

class NotificationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _messaging = FirebaseMessaging.instance;
  final _firestore = FirebaseFirestore.instance;

  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_stat_yes');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? val) {
      print("Notification is tapped $val");
      Navigator.of(navigatorKey.currentContext!).push(
          MaterialPageRoute(builder: (currentContext) => FirebaseLearn()));
    });
  }

  Future<void> showNotification(
      int id, String title, String body, int seconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
        NotificationDetails(
          android: AndroidNotificationDetails('main_channel', 'Main Channel',
              importance: Importance.max,
              priority: Priority.high,
              color: primaryColor,
              colorized: true,
              enableLights: true,
              icon: '@drawable/ic_stat_yes'),
          iOS: IOSNotificationDetails(
            sound: 'default.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: 'YESSS');
  }

  Future<void> getTokenSaveToDb(String currentUserId) async {
    final token = await _messaging.getToken();
    if (token != null) {
      _firestore.collection('users').doc(currentUserId).set(
        {
          'fcmTokens': FieldValue.arrayUnion([token])
        },
      );
    }
  }

  Future<void> sendNotification(Map data) async {
    const url = "https://fcm.googleapis.com/fcm/send";

    final accessToken =
        (await _firestore.collection('app-info').doc('firebase').get())
            .data()?['access-token'];

    // get tokens form firebase
    final usersDocs = await _firestore.collection('users').get();
    final tokens = usersDocs.docs.map((e) {
      if (e.exists && e.data().containsKey('fcmTokens')) {
        return e.data()['fcmTokens'];
      } else {
        return [];
      }
    }).toList();
    try {
      final res = await Dio().post(
        url,
        options: Options(headers: <String, String>{
          'Authorization': 'key=$accessToken',
        }),
        data: <String, dynamic>{
          "registration_ids": tokens[2],
          "notification": {
            "body": "${data['year']} has been created yes.com",
            "title": "${data['name']} is new Platform!",
            "sound": true
          }
        },
      );
      print(tokens);
      if (res.statusCode == 201) {
        print("Created");
      }
    } catch (e) {
      print(e);
    }
  }
}
