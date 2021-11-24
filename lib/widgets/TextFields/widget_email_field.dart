import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailField extends StatefulWidget {

  String hint;
  TextEditingController controller;

   EmailField({
    required this.hint,required this.controller,});

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      child: TextFormField(
      style: TextStyle(
      color: Colors.black,
          fontFamily: 'SFUIDisplay'
      ),
      controller: widget.controller,
      validator: (value){
      if(value!.isEmpty) {
        return "Please enter email";
      }else if(!new  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
        return "Please enter valid email";
      }
      return null;
      },
      decoration: InputDecoration(
        focusColor: Colors.black,
      border: OutlineInputBorder(),
      hintText: widget.hint,
      fillColor: Colors.black,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      prefixIcon: Icon(Icons.email),
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

