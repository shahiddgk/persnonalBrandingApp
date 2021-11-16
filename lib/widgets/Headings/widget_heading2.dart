import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Heading2 extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String H2;

  Heading2(this.H2);

  @override
  _Heading2State createState() => _Heading2State();
}

class _Heading2State extends State<Heading2> {
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.only(top: 25),child: Text(widget.H2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal)));
  }
}