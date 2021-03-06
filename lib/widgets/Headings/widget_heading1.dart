import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class Heading1 extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String H1;

  Heading1(this.H1);

  @override
  _Heading1State createState() => _Heading1State();
}

class _Heading1State extends State<Heading1> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.H1,style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold)
            ),
            Container(margin:EdgeInsets.only(top: 25,bottom: 25),height: 7,width: 100,color: Colors.amber,),
          ],
        ),
    ) : Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.H1,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)
          ),
          Container(margin:EdgeInsets.only(top: 25,bottom: 25),height: 7,width: 90,color: Colors.amber,),
        ],
      ),
    );
  }
}
