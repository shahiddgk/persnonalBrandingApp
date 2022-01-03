import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_picture_details_decription.dart';

class FutureGoalsPictureDetails extends StatefulWidget {


  @override
  _FutureGoalsPictureDetailsState createState() => _FutureGoalsPictureDetailsState();
}

class _FutureGoalsPictureDetailsState extends State<FutureGoalsPictureDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),child:Align(alignment: Alignment.centerLeft,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[

                PictureDetailsDescription("As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”“Create a vision and never let the environment, other people’s beliefs, or the limits of what has been done in the past shape your decisions.”", "Picture Name", "Desgin and developemnt"),

             Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ],),) ,),
          ],
        ),
      ),
    );
  }
}
