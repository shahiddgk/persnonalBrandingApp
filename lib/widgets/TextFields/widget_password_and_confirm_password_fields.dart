import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordFieldAndConfirmPasswordField extends StatefulWidget {

  // ignore: non_constant_identifier_names
  String password_hint;
  // ignore: non_constant_identifier_names
  String confirm_password_hint;
  // ignore: non_constant_identifier_names
  TextEditingController password_controller;
  // ignore: non_constant_identifier_names
  TextEditingController confirm_password_controller;

  PasswordFieldAndConfirmPasswordField({Key? key,
    required this.password_hint,required this.confirm_password_hint,required this.password_controller,required this.confirm_password_controller}) : super(key: key);

  @override
  _PasswordFieldAndConfirmPasswordFieldState createState() => _PasswordFieldAndConfirmPasswordFieldState();
}

class _PasswordFieldAndConfirmPasswordFieldState extends State<PasswordFieldAndConfirmPasswordField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10),
            child:TextFormField(
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'SFUIDisplay'
          ),
          controller: widget.password_controller,
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
              border: const OutlineInputBorder(),
              hintText: widget.password_hint,
              fillColor: Colors.black,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
              ),
              prefixIcon: const Icon(Icons.lock_outline),
              labelStyle: const TextStyle(
                  fontSize: 15
              )
          ),
        )),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child:TextFormField(
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'SFUIDisplay'
          ),
          controller: widget.confirm_password_controller,
          obscureText: true,
          validator: (value){
            if(value!.isEmpty) {
              return "Please enter password";
            }else if(value.length<8){
              return "Password must have 8 characters";
            }else if(value!= widget.password_controller.text){
              return "Password is different";
            }
            return null;
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.confirm_password_hint,
              fillColor: Colors.black,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
              ),
              prefixIcon: const Icon(Icons.lock_outline),
              labelStyle: const TextStyle(
                  fontSize: 15
              )
          ),
        )),
      ],
    );
  }

}

