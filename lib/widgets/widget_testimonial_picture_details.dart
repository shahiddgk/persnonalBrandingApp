import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class testimonialPictureDetails extends StatefulWidget {
  String Imageurl;
  // ignore: non_constant_identifier_names
  String H1;
  // ignore: non_constant_identifier_names
  String H2;
  // ignore: non_constant_identifier_names
  String Description;

  testimonialPictureDetails(this.Imageurl,this.H1,this.H2,this.Description);


  @override
  _testimonialPictureDetailsState createState() => _testimonialPictureDetailsState();
}

class _testimonialPictureDetailsState extends State<testimonialPictureDetails> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet ? Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: 4,
          color: Colors.grey,),
        Container(
          margin: EdgeInsets.only(top: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),child: CircleAvatar(radius:30,child: Image.network(widget.Imageurl)),),
                      Text(widget.H2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                      Text(widget.H1,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Expanded(flex:3,child: Container(width:MediaQuery.of(context).size.width/2,child: Text(widget.Description,style:TextStyle(fontSize: 16),textAlign: TextAlign.justify,))),
            ],
          ),
        )
      ],
    ) : Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 18),
          width: MediaQuery.of(context).size.width,
          height: 2,
          color: Colors.grey,),
        Container(
          margin: EdgeInsets.only(top: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),child: CircleAvatar(radius: 30,child: Image.network(widget.Imageurl)),),
                      Text(widget.H2,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                      Text(widget.H1,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Expanded(flex:3,child: Container(width:MediaQuery.of(context).size.width/2,child: Text(widget.Description,textAlign: TextAlign.justify,))),
            ],
          ),
        )
      ],
    );
  }
}
