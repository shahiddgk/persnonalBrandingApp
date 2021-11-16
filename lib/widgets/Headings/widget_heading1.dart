import 'package:flutter/cupertino.dart';

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
    return Text(widget.H1,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold));
  }
}
