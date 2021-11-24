import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NameField extends StatefulWidget {

  String hint;
  TextEditingController controller;

  NameField({
    required this.hint,required this.controller,});

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {

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
                fillColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                prefixIcon: Icon(Icons.person_outline),
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

