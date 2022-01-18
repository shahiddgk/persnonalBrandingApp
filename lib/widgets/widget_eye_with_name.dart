import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EyeWithName extends StatefulWidget {

  String Name;

  EyeWithName({required this.Name});

  @override
  _EyeWithNameState createState() => _EyeWithNameState();
}

class _EyeWithNameState extends State<EyeWithName> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child:Container(
            margin: const EdgeInsets.only(right: 5),
            child:const Icon(Icons.remove_red_eye_outlined,size: 15,))),
        Expanded(
            flex: 5,
            child:Container(

            child: Text(widget.Name,style: TextStyle(fontSize: 15),)))
      ],
    );
  }
}
