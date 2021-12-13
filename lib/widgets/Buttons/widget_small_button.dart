import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  double Width;

  SmallButton({required this.title, required this.onPressed,required this.Width});

  @override
  _SmallButtonState createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        //color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white,width: 3,)),
      child: ElevatedButton(
        onPressed:() {
          widget.onPressed();
        },//since this is only a UI app
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: Text(widget.title,
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontFamily: 'SFUIDisplay',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
