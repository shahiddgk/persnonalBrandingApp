import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:personal_branding/Drawer/menu_page.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/careersectiontab.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';
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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late FirebaseMessaging messaging;

  @override
  void initState() {
    super.initState();
    _checkedLogin();

    // _isLoading == false
    //     && _isCheckingSession == false
    //     && globalSessionUser.id != 0 ?
    // registerNotification() : null;
    // _isLoading == false
    //     && _isCheckingSession == false
    //     && globalSessionUser.id != 0 ?
    // configLocalNotification(): null;

    // if(_isLoading == false
    //     && _isCheckingSession == false
    //     && globalSessionUser.id != 0 ) {
    //     messaging = FirebaseMessaging.instance;
    //     messaging.getToken().then((value){
    //     print(value);
    //     FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${globalSessionUser.id}").set(
    //         {
    //           FirestoreConstants.nickname: globalSessionUser.name,
    //           FirestoreConstants.photoUrl: '',
    //           FirestoreConstants.id: globalSessionUser.id,
    //           'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
    //           FirestoreConstants.chattingWith: null,
    //           'Token': value
    //         });
    //   });
    // }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;
      if(notification != null && androidNotification != null) {
        showNotification(message.notification!);;
      }
    });

    configLocalNotification();


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

  // void registerNotification() {
  //   messaging.requestPermission();
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
  //  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHnadler);
  //
  //   messaging.getToken().then((token) {
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
  final GoogleSignIn googleSignIn = GoogleSignIn();

  MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
        child: Scaffold(
              drawer: MultiLevelDrawer(
                backgroundColor: Colors.black,
                divisionColor: Colors.white70,
                rippleColor: Colors.amber,
                header: Container(
                      height: size.height * 0.25,
                    child: Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "images/logo3.jpg",
                  width: 160,
                  height: 160,
                ),
              ],
            )),
      ), children: [
                MLMenuItem(onClick: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainWidget(title: '')));
                }, content: const Text("HOME",style: TextStyle(color: Colors.white),)),
        MLMenuItem(
            onClick: (){
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutSection()));
        }, content:const Text("ABOUT",style: TextStyle(color: Colors.white),)),
                MLMenuItem(onClick: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Leadership()));
                }, content:const Text("LEADERSHIP",style: TextStyle(color: Colors.white),)),
                MLMenuItem(onClick: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CareerSection()));
                }, content:const Text("CAREER",style: TextStyle(color: Colors.white),)),
                MLMenuItem(onClick: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Entrepreneur()));
                }, content:const Text("START UP",style: TextStyle(color: Colors.white),)),
                MLMenuItem(onClick: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalCoaching()));
                }, content:const Text("GALLERY",style: TextStyle(color: Colors.white),)),
                MLMenuItem(onClick: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contacts()));
                }, content:const Text("CONTACT",style: TextStyle(color: Colors.white),)),
              ],),
          appBar: AppBar(
            centerTitle: true,
              title: _isLoading == false
                  && _isCheckingSession == false
                  && globalSessionUser.id != 0 ? Text("Welcome ${globalSessionUser.name}") : null,
              //  leading: MenuWidget(),
              actions: [
                _isLoading == false
                    && _isCheckingSession == false
                    && globalSessionUser.id != 0 ?
                IconButton(onPressed: (){
                  setState(() {
                    _isLoading = true;
                  });
                  googleSignIn.signOut();
                  googleSignIn.disconnect();
                  FacebookAuth.i.logOut();
                  // FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${globalSessionUser.id}").update(
                  //     {
                  //       'Token': ' '
                  //     }
                  //     );
                  logoutSessionUser().then((value) => {
                    setState(() {
                      globalSessionUser = value;
                      _isLoading = false;
                    })
                  });
                },icon: const Icon(Icons.logout),) :
                Row(
                  children: <Widget>[
                    Container(
                      height: 35,
                      child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));}, child: const Text("SIGN UP ",style: TextStyle(color: Colors.black),),
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
                    const Text(" | ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 5),
                      height: 35,
                      child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));}, child: const Text("SIGN IN ",style: TextStyle(color: Colors.black),),
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
                  ],)
              ]
          ),
          body: Home(),
    )
    );
  }

  // => ZoomDrawer(
  //   controller: _drawerController,
  //   borderRadius: 40,
  //     slideWidth: MediaQuery.of(context).size.width * 0.5,
  //     showShadow: true,
  //     menuScreen: MenuPage(
  //       currentItem:currentItem,
  //       onSelectedItem: (item) {
  //         setState(() => currentItem = item);
  //         _drawerController.close!();
  //       },
  //     ),
  //     mainScreen: getScreen()!,
  // );

  // Widget? getScreen() {
  //   switch (currentItem) {
  //     case MenuItems.home : return Home();
  //     case MenuItems.about : return AboutSection();
  //     case MenuItems.leadership : return Leadership();
  //     case MenuItems.career : return CareerSection();
  //     case MenuItems.startup : return Entrepreneur();
  //     case MenuItems.gallery : return ProfessionalCoaching();
  //     case MenuItems.contacts : return Contacts();
  //    // case MenuItems.login : return LogIn();
  //   }
  // }
}
