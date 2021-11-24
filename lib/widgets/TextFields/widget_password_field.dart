import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {

  String hint;
  TextEditingController controller;

  PasswordField({
    required this.hint,required this.controller,});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'SFUIDisplay'
          ),
          controller: widget.controller,
          obscureText: true,
          validator: (value){
            if(value!.isEmpty) {
              return "Please enter password";
            }else if(value.length<8){
              return "Password must have 8 characters";
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
              prefixIcon: Icon(Icons.lock_outline),
              labelStyle: TextStyle(
                  fontSize: 15
              )
          ),

        ),
      ],
    );
  }

}

