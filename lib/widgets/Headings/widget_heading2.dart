import 'package:flutter/cupertino.dart';

class Heading2 extends StatefulWidget {
  String H2;
  Heading2(this.H2);

  @override
  _Heading2State createState() => _Heading2State();
}

class _Heading2State extends State<Heading2> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.H2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal));
  }
}
