import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class BiographyBulletoints extends StatefulWidget {
  String Point;

  BiographyBulletoints({required this.Point});

  @override
  _BiographyBulletointsState createState() => _BiographyBulletointsState();
}

class _BiographyBulletointsState extends State<BiographyBulletoints> {
  @override
  Widget build(BuildContext context) {
      return  ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(margin:EdgeInsets.only(bottom: 2),child: Text("• ${widget.Point}",style: TextStyle(color: Colors.black87,fontSize: 23),textAlign: TextAlign.justify,)) : Container(margin:EdgeInsets.only(bottom: 2),child: Text("• ${widget.Point}",style: TextStyle(color: Colors.black87,fontSize: 15),textAlign: TextAlign.justify,));
  }
}
