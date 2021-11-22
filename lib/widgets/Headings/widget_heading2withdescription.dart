import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Container(margin:EdgeInsets.only(bottom: 15),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(widget.H2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)),
        Container(margin:EdgeInsets.only(top: 25),child: Text(widget.Descrition,style: TextStyle(color: Colors.grey),)),
      ],
    ));
  }
}