import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Industry extends StatefulWidget {

  String hint;
  TextEditingController controller;

  Industry({
    required this.hint,required this.controller,});

  @override
  _IndustryState createState() => _IndustryState();
}

class _IndustryState extends State<Industry> {

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
                return "Industry is required";
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.hint,
                fillColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                prefixIcon: Icon(Icons.home_repair_service),
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

