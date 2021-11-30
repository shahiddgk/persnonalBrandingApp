import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String description;

  Description(this.description);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.only(top: 10),child: Text(widget.description,textAlign: TextAlign.justify,style: TextStyle(fontSize:18,color: Colors.black54),));
  }
}
