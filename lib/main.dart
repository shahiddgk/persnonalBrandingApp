import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_branding/providers/auth_provider.dart';
import 'package:personal_branding/providers/chat_provider.dart';
import 'package:personal_branding/providers/home_provider.dart';
import 'package:personal_branding/providers/setting_provider.dart';
import 'package:personal_branding/utills/class_builder.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'drawer.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     "high_importance_channel",
//     "High_Importance_Notification",
//     "This channel is used for importance notification.",importance: Importance.high,playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//

// Future<void> _firebaseMessagingBackgroundHnadler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('You got new : ${message.senderId}');
// }

Future<void> main() async {
  ClassBuilder.registerClasses();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHnadler);
  //
  // await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
   // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {

  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({required this.prefs});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(
              firebaseAuth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
              prefs: this.prefs,
              firebaseFirestore: this.firebaseFirestore,
            ),
          ),
          Provider<SettingProvider>(
            create: (_) => SettingProvider(
              prefs: this.prefs,
              firebaseFirestore: this.firebaseFirestore,
              firebaseStorage: this.firebaseStorage,
            ),
          ),
          Provider<HomeProvider>(
            create: (_) => HomeProvider(
              firebaseFirestore: this.firebaseFirestore,
            ),
          ),
          Provider<ChatProvider>(
            create: (_) => ChatProvider(
              prefs: this.prefs,
              firebaseFirestore: this.firebaseFirestore,
              firebaseStorage: this.firebaseStorage,
            ),
          ),
        ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryColor: Colors.amber,
            cursorColor: Colors.black,
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.black
            )
        ),
        builder: (context,child) {
          child = EasyLoading.init()(context,child);
          child = ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, child),
              breakpoints: const [
                ResponsiveBreakpoint.resize(350,name: MOBILE),
                ResponsiveBreakpoint.resize(600,name: TABLET),
                ResponsiveBreakpoint.resize(800,name: DESKTOP),
                ResponsiveBreakpoint.autoScale(1700,name: 'XL'),
              ]
          );
          return child;
        },
        debugShowCheckedModeBanner: false,
        home: MainWidget(title: ' ',),
      ),
    );
  }
}


