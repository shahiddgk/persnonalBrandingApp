import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:personal_branding/Drawer/menu_page.dart';
import 'package:personal_branding/Pages/careersectiontab.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'Pages/Entrepreneur/entrepreneur.dart';
import 'Pages/Professional_Coaching/professional_coaching.dart';
import 'Pages/aboutsectiontab.dart';
import 'Pages/contacts.dart';
import 'Pages/home.dart';
import 'Pages/leadership.dart';
import 'constants/firestore_constants.dart';

class MainWidget extends StatefulWidget {
  MainWidget({required this.title});

  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  bool _isCheckingSession = true;
  bool _isLoading = true;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  @override
  void initState() {
    super.initState();
    _checkedLogin();

    // if(_isLoading == false
    //     && _isCheckingSession == false
    //     && globalSessionUser.id != 0 ) {
    //   registerNotification();
    //   configLocalNotification();
    // }


    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? androidNotification = message.notification?.android;
    //   if(notification != null && androidNotification != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             channel.description,
    //             playSound: true,
    //             color: Colors.blue,
    //             icon: '@mipmap/ic_launcher',
    //           )
    //         ));
    //   }
    // });
    //
    // if(_isLoading == false && _isCheckingSession == false && globalSessionUser.id != 0)
    //     {
    //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //     print('A new onMessageOpend event was published');
    //     RemoteNotification? notification = message.notification;
    //     AndroidNotification? android = message.notification!.android;
    //     if (notification != null && android != null) {
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => Entrepreneur()));
    //     }
    //   });
    // }
  }

  // void registerNotification() {
  //   firebaseMessaging.requestPermission();
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     // ignore: avoid_print
  //     print('onMessage: $message');
  //     if (message.notification != null) {
  //       showNotification(message.notification!);
  //     }
  //     return;
  //   });
  //
  // // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHnadler);
  //
  //   firebaseMessaging.getToken().then((token) {
  //     print(globalSessionUser.id);
  //     print('push token: $token');
  //     if (token != null) {
  //       FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc(_isLoading == false && _isCheckingSession == false && globalSessionUser.id != 0 ? "${globalSessionUser.id}":'').update({'pushToken': token});
  //             }
  //   }).catchError((err) {
  //     showAlert(context, err.toString(), true, () {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }, () {
  //     });
  //   });
  // }
  //
  // Future<void> _firebaseMessagingBackgroundHnadler(RemoteMessage message) async {
  //   await Firebase.initializeApp();
  //   print('You got new : ${message.senderId}');
  // }
  //
  // void configLocalNotification() {
  //   AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  //   IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
  //   InitializationSettings initializationSettings =
  //   InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }
  //
  // void showNotification(RemoteNotification remoteNotification) async {
  //   AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     Platform.isAndroid ? '1:432743666780:android:a598da153588f2219c4299' : '1:432743666780:ios:ad0a9278be2cae2c9c4299',
  //     'Ahmed Hussein',
  //     'New Message received',
  //     playSound: true,
  //     enableVibration: true,
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   NotificationDetails platformChannelSpecifics =
  //   NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  //
  //   print(remoteNotification);
  //
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     remoteNotification.title,
  //     remoteNotification.body,
  //     platformChannelSpecifics,
  //     payload: null,
  //   );
  // }

  Future _checkedLogin() async {
    await getUserSession().then((value) => {
          if (value.id == 0)
            {
              setState(() {
                _isCheckingSession = false;
                _isLoading = false;
              })
            }
          else
            {
              setState(() {
                _isCheckingSession = false;
                globalSessionUser = value;
                _isLoading = false;
              }),
            }
        });
  }

  final _drawerController = ZoomDrawerController();

  MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) => ZoomDrawer(
    controller: _drawerController,
    borderRadius: 40,
      slideWidth: MediaQuery.of(context).size.width * 0.5,
      showShadow: true,
      menuScreen: MenuPage(
        currentItem:currentItem,
        onSelectedItem: (item) {
          setState(() => currentItem = item);
          _drawerController.close!();
        },
      ),
      mainScreen: getScreen()!,
  );

  Widget? getScreen() {
    switch (currentItem) {
      case MenuItems.home : return Home();
      case MenuItems.about : return AboutSection();
      case MenuItems.leadership : return Leadership();
      case MenuItems.career : return CareerSection();
      case MenuItems.startup : return Entrepreneur();
      case MenuItems.gallery : return ProfessionalCoaching();
      case MenuItems.contacts : return Contacts();
     // case MenuItems.login : return LogIn();
    }
  }
}
