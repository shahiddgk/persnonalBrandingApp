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
import 'package:personal_branding/utills/utils.dart';

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
          centerTitle: true,
          title: _isLoading == false &&
              _isCheckingSession == false &&
              globalSessionUser.token != ""? Text(globalSessionUser.name) : null,
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