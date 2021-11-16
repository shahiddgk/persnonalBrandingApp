import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconDescription extends StatefulWidget {
  IconData icon;
  // ignore: non_constant_identifier_names
  String H1;
  // ignore: non_constant_identifier_names
  String H2;
  // ignore: non_constant_identifier_names
  String H3;
  // ignore: non_constant_identifier_names
  String Description;

  IconDescription(this.icon,this.H1,this.H2,this.H3,this.Description);


  @override
  _IconDescriptionState createState() => _IconDescriptionState();
}

class _IconDescriptionState extends State<IconDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 18),
          width: MediaQuery.of(context).size.width,
          height: 2,
          color: Colors.grey,),
        SizedBox(height: 8,),
        Container(
          margin: EdgeInsets.only(top: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(widget.icon,size: 35,color: Colors.amber,),
                  Text(widget.H2,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                  Text(widget.H1,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),Text(widget.H3),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.2,),
              Text(widget.Description),
            ],
          ),
        )
      ],
    );
  }
}
