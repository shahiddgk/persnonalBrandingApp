import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final Function onPressed;
  double Width;

   Button({required this.title, required this.onPressed,required this.Width});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 25,right: 10),
      width: widget.Width,
      decoration: BoxDecoration(border: Border.all(color: Colors.yellow,width: 3)),
      child: MaterialButton(
        onPressed:() {
          widget.onPressed();
        },//since this is only a UI app
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
      ),
    );
  }
}
