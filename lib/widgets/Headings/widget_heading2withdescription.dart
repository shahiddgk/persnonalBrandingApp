import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

// ignore: must_be_immutable
class Heading2WithDescription extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String H2;
  String Descrition;

  Heading2WithDescription(this.H2,this.Descrition);

  @override
  _Heading2WithDescriptionState createState() => _Heading2WithDescriptionState();
}

class _Heading2WithDescriptionState extends State<Heading2WithDescription> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(margin:EdgeInsets.only(bottom: 1),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(widget.H2,style: TextStyle(fontSize: 28,fontWeight: FontWeight.normal)),
        Container(margin:EdgeInsets.only(top: 25),child: Text(widget.Descrition,style: TextStyle(color: Colors.black87,fontSize: 18),textAlign: TextAlign.justify,)),
      ],
    )) :  Container(margin:EdgeInsets.only(bottom: 15),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(widget.H2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)),
        Container(margin:EdgeInsets.only(top: 25),child: Text(widget.Descrition,style: TextStyle(color: Colors.black87),textAlign: TextAlign.justify,)),
      ],
    ));
  }
}