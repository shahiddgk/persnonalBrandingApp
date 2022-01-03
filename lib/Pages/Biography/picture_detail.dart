import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/widget_picture_details_decription.dart';

class PictureDetails extends StatefulWidget {

  @override
  _PictureDetailsState createState() => _PictureDetailsState();
}

class _PictureDetailsState extends State<PictureDetails> {
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

              PictureDetailsDescription("Tony’s 6 internationally best selling books, audio, video, and seminar trainings will empower you with the knowledge and tool you need to create lifelong success in life and business. More than 4 million people have attended Tony’s live seminars, and more than 50 million people from 100 countries have experienced the absolute power of his teachings, making him the #1 personal and professional development leader of all time.", "PICTURE NAME", "DESIGN AND dEVELOPMENT"),

              Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ],),) ,),
          ],
        ),
      ),
    );
  }
}
