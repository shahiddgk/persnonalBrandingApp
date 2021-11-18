import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageField extends StatefulWidget {

  String hint;
  TextEditingController controller;

  MessageField({
    required this.hint,required this.controller,});

  @override
  _MessageFieldState createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            maxLines: 4,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'SFUIDisplay'
            ),

            controller: widget.controller,
            validator: (value){
              if(value!.isEmpty) {
                return "Message is required";
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.hint,
                prefixIcon: Icon(Icons.message),
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

