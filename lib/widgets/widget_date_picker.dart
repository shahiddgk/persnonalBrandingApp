import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateField extends StatefulWidget {

  String hint;
  TextEditingController controller;
  Function onTap;

  DateField({
    required this.hint,required this.controller,required this.onTap});

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            readOnly: true,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'SFUIDisplay'
            ),
            controller: widget.controller,
            validator: (value){
              if(value!.isEmpty) {
                return "Date is required";
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
            onTap: (){widget.onTap();},
          ),
        ),
      ],
    );
  }
}

