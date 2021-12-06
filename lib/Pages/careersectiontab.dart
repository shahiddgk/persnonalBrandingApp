import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Achievement/achievement.dart';
import 'package:personal_branding/Pages/Biography/biography.dart';
import 'package:personal_branding/Pages/Future_Goals/future_goals.dart';
import 'package:personal_branding/Pages/Testimonials/testimonials.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/careers.dart';
import 'package:personal_branding/Pages/experience.dart';

// ignore: must_be_immutable
class CareerSection extends KFDrawerContent {
  @override
  _CareerSectionState createState() => _CareerSectionState();
}

class _CareerSectionState extends State<CareerSection> with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
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