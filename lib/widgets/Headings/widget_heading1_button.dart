import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/Pages/Entrepreneur/entrepreneur.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class Heading1WithButton extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String H1;

  Heading1WithButton(this.H1);

  @override
  _Heading1WithButtonState createState() => _Heading1WithButtonState();
}

class _Heading1WithButtonState extends State<Heading1WithButton> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.H1,style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold)
          ),
          Button(title: "LET's START SOMETHING BIG", onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Entrepreneur()));},),
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
          Button(title: "LET's START SOMETHING BIG", onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Entrepreneur()));},),
          Container(margin:EdgeInsets.only(top: 25,bottom: 25),height: 7,width: 90,color: Colors.amber,),
        ],
      ),
    );
  }
}
