import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:personal_branding/Drawer/menu_page.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/careersectiontab.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'Pages/Entrepreneur/entrepreneur.dart';
import 'Pages/Professional_Coaching/professional_coaching.dart';
import 'Pages/aboutsectiontab.dart';
import 'Pages/contacts.dart';
import 'Pages/forms.dart';
import 'Pages/home.dart';

class MainWidget extends StatefulWidget {
  MainWidget({required this.title});

  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  bool _isCheckingSession = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkedLogin();
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
