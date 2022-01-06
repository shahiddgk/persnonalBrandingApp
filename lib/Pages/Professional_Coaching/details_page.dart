import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_description_text.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/widget_buttons_row.dart';
import 'package:personal_branding/widgets/widget_comment_section.dart';
import 'package:personal_branding/widgets/widget_socialmedia_tags_professional.dart';

import '../../drawer.dart';

class PictureDetails extends StatefulWidget {
  const PictureDetails({Key? key}) : super(key: key);

  @override
  _PictureDetailsState createState() => _PictureDetailsState();
}

class _PictureDetailsState extends State<PictureDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Heading2("THIS IS A STANDARD POST WITH PREVIEW IMAGE"),

            //  ButtonsRow("HOME",(){},"BLOG",(){},"THIS IS A STANDARD POST",(){}),

              ButtonsRow("Admin",(){},"Web Design",(){},"Comments",(){}),

              Align(alignment:Alignment.topCenter,child: Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")),

              Description("As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”“Create a vision and never let the environment, other people’s beliefs, or the limits of what has been done in the past shape your decisions.”"),

              SocialMediaTags((){},(){},(){},(){},(){}),

              CommentsSection("Kaleem", "Nov 23 2021", "https://cdn4.vectorstock.com/i/1000x1000/44/73/boy-avatar-in-round-web-button-isolated-on-white-vector-20694473.jpg",(){},"As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”"),


            ],
          ),
        ),
      ),
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}
