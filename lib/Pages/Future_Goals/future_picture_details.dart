import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1,left: 20,right: 20),child:Align(alignment: Alignment.centerLeft,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
            Heading1("Picture Name"),
            SizedBox(height: 2,),
            Heading2("website Design"),
            SizedBox(
              height: 5,
            ),
            Container(height: 7,width: MediaQuery.of(context).size.width,color: Colors.amberAccent,),
            SizedBox(height: 5,),
            Text("Description"),
            SizedBox(height: 20,),
            Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")),
          ],),) ,),
        ],
      ),
    );
  }
}
