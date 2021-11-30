import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Heading2 extends StatefulWidget {
  String H2;
  Heading2(this.H2);

  @override
  _Heading2State createState() => _Heading2State();
}

class _Heading2State extends State<Heading2> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Text(widget.H2,style: TextStyle(fontSize: 28,fontWeight: FontWeight.normal)) : Text(widget.H2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal));
  }
}
