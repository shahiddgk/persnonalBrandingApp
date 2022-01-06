import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_picture_details_decription.dart';

import '../../drawer.dart';

class AchievementPictureDetails extends StatefulWidget {

  @override
  _AchievementPictureDetailsState createState() => _AchievementPictureDetailsState();
}

class _AchievementPictureDetailsState extends State<AchievementPictureDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20,right: 20),child:Align(alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

              PictureDetailsDescription("Tony’s 6 internationally best selling books, audio, video, and seminar trainings will empower you with the knowledge and tool you need to create lifelong success in life and business. More than 4 million people have attended Tony’s live seminars, and more than 50 million people from 100 countries have experienced the absolute power of his teachings, making him the #1 personal and professional development leader of all time.", "PICTURE NAME", "DESIGN AND DEVELOPMENT"),

              Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ],),) ,),
          ],
        ),
      ),
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}
