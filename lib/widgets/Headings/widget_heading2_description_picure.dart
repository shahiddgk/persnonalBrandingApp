import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

// ignore: must_be_immutable
class Heading2WithDescriptionWiithImage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String H2;
  String Descrition;
  String ImageUrl;
  Function onTap;

  Heading2WithDescriptionWiithImage(this.H2,this.Descrition,this.ImageUrl,this.onTap);

  @override
  _Heading2WithDescriptionWiithImageState createState() => _Heading2WithDescriptionWiithImageState();
}

class _Heading2WithDescriptionWiithImageState extends State<Heading2WithDescriptionWiithImage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(margin:EdgeInsets.only(bottom: 1),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(widget.H2,style: TextStyle(fontSize: 28,fontWeight: FontWeight.normal)),
        Container(margin:EdgeInsets.only(top: 25,),child: Text(widget.Descrition,style: TextStyle(color: Colors.black87,fontSize: 18),textAlign: TextAlign.justify,)),
        InkWell(
            onTap: () {
              widget.onTap();
            },

            child: Container(margin:EdgeInsets.only(top:15,bottom: 15),child: AspectRatio(
                aspectRatio: 3/3,
                child: Image.network(widget.ImageUrl))),
        )],
    )) :  Container(margin:EdgeInsets.only(bottom: 15),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(widget.H2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)),
        Container(margin:EdgeInsets.only(top: 25,bottom: 10),child: Text(widget.Descrition,style: TextStyle(color: Colors.black87),textAlign: TextAlign.justify,)),

        InkWell(
          onTap: () {
            widget.onTap();
          },

          child: Container(margin:EdgeInsets.only(top:15,bottom: 15),child: Image.network(widget.ImageUrl,fit: BoxFit.fill,)),
        )

      ],
    ));
  }
}