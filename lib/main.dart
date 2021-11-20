import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/utills/class_builder.dart';


import 'drawer.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow
      ),
      debugShowCheckedModeBanner: false,
      home: MainWidget(title: ' ',),
    );
  }
}


