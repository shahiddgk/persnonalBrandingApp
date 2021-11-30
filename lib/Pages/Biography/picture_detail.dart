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

              PictureDetailsDescription("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "PICTURE NAME", "DESIGN AND dEVELOPMENT"),

              Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ],),) ,),
          ],
        ),
      ),
    );
  }
}
