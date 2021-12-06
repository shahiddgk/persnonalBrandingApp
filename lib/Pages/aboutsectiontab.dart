import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Achievement/achievement.dart';
import 'package:personal_branding/Pages/Biography/biography.dart';
import 'package:personal_branding/Pages/Future_Goals/future_goals.dart';
import 'package:personal_branding/Pages/about.dart';


// ignore: must_be_immutable
class AboutSection extends KFDrawerContent {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
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
            Tab(text: "ABOUT",),
            Tab(text: "BIOGRAPHY",),
            Tab(text: "ACHIEVEMENT",),
            Tab(text: "FUTURE GOALS",),
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