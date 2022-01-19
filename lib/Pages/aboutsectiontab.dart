import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/Achievement/achievement.dart';
import 'package:personal_branding/Pages/Biography/biography.dart';
import 'package:personal_branding/Pages/Future_Goals/future_goals.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/constants/firestore_constants.dart';
import 'package:personal_branding/utills/utils.dart';


// ignore: must_be_immutable
class AboutSection extends KFDrawerContent {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> with SingleTickerProviderStateMixin {

  late TabController controller;
  bool _isCheckingSession = true;
  bool _isLoading = true;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();

    _checkedLogin();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
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
            // FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${globalSessionUser.id}").update(
            //     {
            //       'Token': ' '
            //     }
            // );
            googleSignIn.signOut();
            googleSignIn.disconnect();
            FacebookAuth.i.logOut();
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
        // leading: MenuWidget(),
         bottom: TabBar(
          isScrollable: true,
          controller: controller,
          indicatorColor: Colors.black87,
          tabs: const [
            Tab(text: "ABOUT",),
            Tab(text: "BIOGRAPHY",),
            Tab(text: "ACHIEVEMENT",),
            Tab(text: "ACTIVITIES",),
          ],),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          About(),
          Biography(),
        Achievement(),
        FutureGoals(),
        // Achievement(),
      ],
      )
      //   child: Center(
      //     child: Column(
      //       children: <Widget>[
      //         // Row(
      //         //   children: <Widget>[
      //         //     ClipRRect(
      //         //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
      //         //       child: Material(
      //         //         shadowColor: Colors.transparent,
      //         //         color: Colors.transparent,
      //         //         child: IconButton(
      //         //           icon: Icon(
      //         //             Icons.menu,
      //         //             color: Colors.black,
      //         //           ),
      //         //           onPressed: widget.onMenuPressed,
      //         //         ),
      //         //       ),
      //         //     ),
      //         //   ],
      //         // ),
      //         Expanded(
      //           child: SingleChildScrollView(
      //             scrollDirection: Axis.vertical,
      //             child: Stack(
      //               alignment: Alignment.topLeft,
      //               children: <Widget>[
      //
      //               //  Image.network("https://www.nicepng.com/png/detail/365-3655520_cristiano-ronaldo-render-cristiano-ronaldo-white-background.png"),
      //
      //                 Align(alignment:Alignment.centerRight,child: Image.asset("images/mes.jpg",fit: BoxFit.cover,)),
      //
      //                 Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
      //                   child: Align(alignment: Alignment.centerLeft,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: <Widget>[
      //                         Heading1("ABOUT"),
      //
      //                         AboutSectionDetails("Dr.Abdul Hussien ", "example@gmail.com", "123456789", "23 February 1998", "Peshawer Pakistan", "Pakistan"),
      //
      //                         Heading2WithDescription("PROFESSIONAL PROFILE","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
      //
      //                       Image.asset("images/sss.png"),
      //
      //                       // Button(title: "Download Resume as PDF",onPressed: (){},)
      //                         ],
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}