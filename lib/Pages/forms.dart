import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Achievement/achievement.dart';
import 'package:personal_branding/Pages/Biography/biography.dart';
import 'package:personal_branding/Pages/Future_Goals/future_goals.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';


// ignore: must_be_immutable
class Forms extends KFDrawerContent {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
          bottom: TabBar(
            indicatorColor: Colors.black87,
            isScrollable: true,
            controller: controller,
            tabs: const [
              Tab(text: "REGISTER",),
              Tab(text: "LOGIN",),
            ],),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Register(),
            LogIn(),
            // Achievement(),
          ],
        )
    );
  }
}