import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';

class ButtonsRow extends StatefulWidget {

  Function RegisterClick;
  Function LoginClick;

  ButtonsRow({required this.RegisterClick,required this.LoginClick});

  @override
  _ButtonsRowState createState() => _ButtonsRowState();
}

class _ButtonsRowState extends State<ButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: <Widget>[
        Button(
          title: "SIGN UP",
          onPressed: () {
            widget.RegisterClick();
          },
        ),
        Button(
          title: "SIGN IN",
          onPressed: () {
           widget.LoginClick();
          },
        ),
      ],
    );
  }
}
