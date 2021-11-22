import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';

class PictureDetailsDescription extends StatefulWidget {
  String Description;
  String H1;
  String H2;
 PictureDetailsDescription(this.Description,this.H1,this.H2);

  @override
  _PictureDetailsDescriptionState createState() => _PictureDetailsDescriptionState();
}

class _PictureDetailsDescriptionState extends State<PictureDetailsDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25,bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: Text(widget.H1,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)
            ),
          ),
          Text(widget.H2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal)),
          Container(margin:EdgeInsets.only(top:25,bottom: 25),height: 6,width: MediaQuery.of(context).size.width,color: Colors.amberAccent,),
          Text(widget.Description,style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,),
        ],
      ),
    );
  }
}
