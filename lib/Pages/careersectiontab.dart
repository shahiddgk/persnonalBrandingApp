import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/Achievement/achievement.dart';
import 'package:personal_branding/Pages/Biography/biography.dart';
import 'package:personal_branding/Pages/Future_Goals/future_goals.dart';
import 'package:personal_branding/Pages/Testimonials/testimonials.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/careers.dart';
import 'package:personal_branding/Pages/experience.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/utills/utils.dart';

import 'login.dart';

// ignore: must_be_immutable
class CareerSection extends KFDrawerContent {
  @override
  _CareerSectionState createState() => _CareerSectionState();
}

class _CareerSectionState extends State<CareerSection> with SingleTickerProviderStateMixin {

  late TabController controller;
  bool _isCheckingSession = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkedLogin();
    controller = TabController(length: 3, vsync: this);
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

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading == false
                && _isCheckingSession == false
                && globalSessionUser.id != 0 ?
            IconButton(onPressed: (){
              setState(() {
                _isLoading = true;
              });
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
          ],
          centerTitle: true,
          title: _isLoading == false &&
              _isCheckingSession == false &&
              globalSessionUser.token != ""? Text("Welcome ${globalSessionUser.name}") : null,
          leading: MenuWidget(),
          bottom: TabBar(
            isScrollable: true,
            controller: controller,
            indicatorColor: Colors.black87,
            tabs: const [
              Tab(text: "CAREER",),
              Tab(text: "EXPERIENCE",),
              Tab(text: "TESTIMONIAL",),
            ],),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Career(),
            Experience(),
            Testimonials(),
          ],
        )
    );
  }
}