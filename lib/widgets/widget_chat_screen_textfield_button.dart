import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldAndButton extends StatefulWidget {

  String Hint;
  String ButtonTitle;
  Function onpressed;
  TextEditingController _controller;

  TextFieldAndButton(this._controller,this.ButtonTitle,this.Hint,this.onpressed);

  @override
  _TextFieldAndButtonState createState() => _TextFieldAndButtonState();
}

class _TextFieldAndButtonState extends State<TextFieldAndButton> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(height: 58,color: Colors.black12,width: MediaQuery.of(context).size.width*0.73,child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: widget.Hint,
              border: InputBorder.none
          ),
        ),
      ),),
      Container(height: 58,width: 75,color: Colors.green,child: Align(alignment:Alignment.center,child: TextButton(child: Text(widget.ButtonTitle,style: TextStyle(color: Colors.white),),onPressed: widget.onpressed(),)),)
    ],);
  }
}
