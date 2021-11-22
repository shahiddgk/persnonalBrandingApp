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
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 10,right: 10),child:Align(alignment: Alignment.centerLeft,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[

                PictureDetailsDescription("PICTURE DESCRIPTION", "Picture Name", "Desgin and developemnt"),

              Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")),
            ],),) ,),
          ],
        ),
      ),
    );
  }
}
