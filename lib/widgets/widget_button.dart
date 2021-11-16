import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final Function onPressed;

  const Button({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:(){},//since this is only a UI app
      child: Text(widget.title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontFamily: 'SFUIDisplay',
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.yellow,
      elevation: 0,
      minWidth: 400,
      height: 50,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
