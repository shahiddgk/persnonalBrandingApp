import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'Pages/about.dart';
import 'Pages/Achievement/achievement.dart';
import 'Pages/login.dart';
import 'Pages/register.dart';
import 'Pages/Biography/biography.dart';
import 'Pages/careers.dart';
import 'Pages/contacts.dart';
import 'Pages/Entrepreneur/entrepreneur.dart';
import 'Pages/experience.dart';
import 'Pages/Future_Goals/future_goals.dart';
import 'Pages/home.dart';
import 'Pages/partnership.dart';
import 'Pages/Professional_Coaching/professional_coaching.dart';
import 'Pages/testimonials.dart';
import 'utills/class_builder.dart';

class MainWidget extends StatefulWidget {
  MainWidget({required this.title});
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: Home(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          // icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'About',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          //  icon: Icon(Icons.account_box, color: Colors.white),
          page: About(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Biography',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.notifications_active, color: Colors.white),
          page: Biography(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Achievement',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.trending_up, color: Colors.white),
          page: Achievement(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Future goals',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.av_timer, color: Colors.white),
          page: FutureGoals(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Experience',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Experience(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Testimonials',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Testimonials(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Professional Coaching',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          //  icon: Icon(Icons.settings, color: Colors.white),
          page: ProfessionalCoaching(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Entrepreneur',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Entrepreneur(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Partnership',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Partnership(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Careers',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Career(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Login Form',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: LogIn(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Register Form',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Register(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Contact',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Contacts(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
                  height: 50,
                  width: 30,
              color: Colors.amber,
              child: Center(
                child: Text("Logo",style: TextStyle(color: Colors.white),),
              ),
                ),

          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}