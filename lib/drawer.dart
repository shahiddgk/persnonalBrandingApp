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

    if(_isLoading == false
        && _isCheckingSession == false
        && globalSessionUser.id != 0 ) {
      registerNotification();
      configLocalNotification();
    }


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
    if(_isLoading == false && _isCheckingSession == false && globalSessionUser.id != 0)
        {
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpend event was published');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification!.android;
        if (notification != null && android != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Entrepreneur()));
        }
      });
    }
  }

  void registerNotification() {
    firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('onMessage: $message');
      if (message.notification != null) {
        showNotification(message.notification!);
      }
      return;
    });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHnadler);

    firebaseMessaging.getToken().then((token) {
      print(globalSessionUser.id);
      print('push token: $token');
      if (token != null) {
        FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc(_isLoading == false && _isCheckingSession == false && globalSessionUser.id != 0 ? "${globalSessionUser.id}":'').update({'pushToken': token});
              }
    }).catchError((err) {
      showAlert(context, err.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
      });
    });
  }

  Future<void> _firebaseMessagingBackgroundHnadler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('You got new : ${message.senderId}');
  }

  void configLocalNotification() {
    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
    InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(RemoteNotification remoteNotification) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      Platform.isAndroid ? '1:432743666780:android:a598da153588f2219c4299' : '1:432743666780:ios:ad0a9278be2cae2c9c4299',
      'Ahmed Hussein',
      'New Message received',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    print(remoteNotification);

    await flutterLocalNotificationsPlugin.show(
      0,
      remoteNotification.title,
      remoteNotification.body,
      platformChannelSpecifics,
      payload: null,
    );
  }

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
      case MenuItems.career : return CareerSection();
      case MenuItems.startup : return Entrepreneur();
      case MenuItems.gallery : return ProfessionalCoaching();
      case MenuItems.contacts : return Contacts();
     // case MenuItems.login : return LogIn();
    }

  }


      // SafeArea(
      // child: Scaffold(
      //   drawer: MultiLevelDrawer(
      //     backgroundColor: Colors.black,
      //     subMenuBackgroundColor: Colors.white,
      //     divisionColor: Colors.white,
      //     header: Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       width: MediaQuery.of(context).size.width * 0.3,
      //       height: MediaQuery.of(context).size.height * 0.1,
      //       child: Container(
      //         height: 70,
      //         width: 50,
      //         child: Center(child: Image.asset("images/logo2.png")),
      //       ),
      //     ),
      //     children: [
      //       MLMenuItem(
      //           content: const Text("HOME",style: TextStyle(color: Colors.white, fontSize: 18)),
      //           onClick: (){
      //             Navigator.of(context).pop();
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
      //           },
      //       ),
      //       MLMenuItem(
      //         content: const Text("ABOUT",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => About()));
      //         },
      //       ),
      //       MLMenuItem(
      //         content: const Text("CAREERS",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => CareerSection()));
      //         },
      //       ),
      //
      //       MLMenuItem(
      //         content: const Text("GALLERY",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalCoaching()));
      //         },
      //       ),
      //
      //       MLMenuItem(
      //         content: const Text("STARTUP",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Entrepreneur()));
      //         },
      //       ),
      //
      //       MLMenuItem(
      //         content: const Text("CONTACT",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contacts()));
      //         },
      //       ),
      //
      //
      //       _isLoading == false &&
      //           _isCheckingSession == false &&
      //           globalSessionUser.token != ""
      //           ? MLMenuItem(
      //         content: const Text("LOGOUT",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           setState(() {
      //             _isLoading = true;
      //           });
      //           logoutSessionUser().then((value) => {
      //             setState(() {
      //               globalSessionUser = value;
      //               _isLoading = false;
      //             })
      //           });
      //         },
      //       ) :  MLMenuItem(
      //         content: const Text("LOGIN",style: TextStyle(color: Colors.white, fontSize: 18)),
      //         onClick: (){
      //           Navigator.of(context).pop();
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Forms()));
      //         },
      //       ),
      //     ],
      //   ),
      //   body: Home(),

        // KFDrawer(
        //   scrollable: true,
        //   controller: KFDrawerController(
        //     initialPage: Home(),
        //     items: [
        //       KFDrawerItem.initWithPage(
        //         text: Text('HOME',
        //             style: TextStyle(color: Colors.white, fontSize: 18)),
        //         page: Home(),
        //       ),
        //       KFDrawerItem.initWithPage(
        //         text: const Text(
        //           'ABOUT',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //         page: AboutSection(),
        //       ),
        //       KFDrawerItem.initWithPage(
        //         text: const Text(
        //           'CAREERS',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //         page: CareerSection(),
        //       ),
        //       KFDrawerItem.initWithPage(
        //         text: const Text(
        //           'GALLERY',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //         page: ProfessionalCoaching(),
        //       ),
        //       KFDrawerItem.initWithPage(
        //         text: const Text(
        //           'STARTUP',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //         // icon: Icon(Icons.settings, color: Colors.white),
        //         page: Entrepreneur(),
        //       ),
        //       KFDrawerItem.initWithPage(
        //         text: const Text(
        //           'CONTACT',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //         // icon: Icon(Icons.settings, color: Colors.white),
        //         page: Contacts(),
        //       ),
        //       _isLoading == false &&
        //               _isCheckingSession == false &&
        //               globalSessionUser.token != ""
        //           ? KFDrawerItem(
        //               text: const Text(
        //                 'LOGOUT',
        //                 style: TextStyle(color: Colors.white, fontSize: 18),
        //               ),
        //               onPressed: () {
        //                 setState(() {
        //                   _isLoading = true;
        //                 });
        //                 logoutSessionUser().then((value) => {
        //                       setState(() {
        //                         globalSessionUser = value;
        //                         _isLoading = false;
        //                       })
        //                     });
        //               },
        //             )
        //           : KFDrawerItem.initWithPage(
        //               text: const Text(
        //                 'LOGIN',
        //                 style: TextStyle(color: Colors.white, fontSize: 18),
        //               ),
        //               // icon: Icon(Icons.settings, color: Colors.white),
        //               page: Forms(),
        //             ),
        //     ],
        //   ),
        //   header: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //       width: MediaQuery.of(context).size.width * 0.3,
        //       height: MediaQuery.of(context).size.height * 0.1,
        //       child: Container(
        //         height: 70,
        //         width: 50,
        //         child: Center(child: Image.asset("images/logo2.png")),
        //       ),
        //     ),
        //   ),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     gradient: const LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [Colors.black, Colors.black],
        //       tileMode: TileMode.repeated,
        //     ),
        //   ),
        // ),
    //   ),
    // );
}
