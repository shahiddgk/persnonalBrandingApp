import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IndustryTitle extends StatefulWidget {

  String hint;
  TextEditingController controller;

  IndustryTitle({
    required this.hint,required this.controller,});

  @override
  _IndustryTitleState createState() => _IndustryTitleState();
}

class _IndustryTitleState extends State<IndustryTitle> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'SFUIDisplay'
            ),
            controller: widget.controller,
            validator: (value){
              if(value!.isEmpty) {
                return "Name is required";
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.hint,
                prefixIcon: Icon(Icons.title),
                labelStyle: TextStyle(
                    fontSize: 15
                )
            ),
          ),
        ),
      ],
    );
  }
}

