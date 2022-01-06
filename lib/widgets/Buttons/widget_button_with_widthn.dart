import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithWidth extends StatefulWidget {
  final String title;
  final Function onPressed;
  double Width;

  ButtonWithWidth({required this.title, required this.onPressed,required this.Width});

  @override
  _ButtonWithWidthState createState() => _ButtonWithWidthState();
}

class _ButtonWithWidthState extends State<ButtonWithWidth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5,right: 5),
      margin:EdgeInsets.only(top: 25),
      width: widget.Width,

      decoration: BoxDecoration(
        //color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
        //   border: Border.all(
        // //color: Colors.white,
        //     width: 3,)
      ),
      child: ElevatedButton(
        onPressed:() {
          widget.onPressed();
        }, //since this is only a UI app
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: Text(widget.title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontFamily: 'SFUIDisplay',
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
    );
  }
}
