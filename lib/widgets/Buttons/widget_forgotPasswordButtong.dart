// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  final String title;
  final Function onPressed;

  const ForgotPassword({required this.title, required this.onPressed});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      // ignore: file_names
      child: TextButton(onPressed: () { widget.onPressed; },
      child: Text(widget.title,style: TextStyle(color: Colors.black),)),
    );
  }
}
