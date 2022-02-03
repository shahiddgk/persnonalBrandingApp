import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class buisnessPictureDetails extends StatefulWidget {
  String Imageurl;
  // ignore: non_constant_identifier_names
  String H1;
  // ignore: non_constant_identifier_names
  String H2;
  // ignore: non_constant_identifier_names
  Widget Description;

  buisnessPictureDetails(this.Imageurl,this.H1,this.H2,this.Description);


  @override
  _buisnessPictureDetailsState createState() => _buisnessPictureDetailsState();
}

class _buisnessPictureDetailsState extends State<buisnessPictureDetails> {
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
                      Image.network(
                        widget.Imageurl,
                      ),
                      Text(widget.H2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                      Text(widget.H1,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Expanded(flex:3,child: Container(width:MediaQuery.of(context).size.width/2,child: widget.Description)),
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
                      Image.network(
                        widget.Imageurl,
                      ),
                      Text(widget.H2,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                      Text(widget.H1,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Expanded(flex:3,child: Container(width:MediaQuery.of(context).size.width/2,child: widget.Description)),
            ],
          ),
        )
      ],
    );
  }
}
