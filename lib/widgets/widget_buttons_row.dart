import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ButtonsRow extends StatefulWidget {
  String B1_title;
  String B2_title;
  String B3_title;

  Function B1_Onpessed;
  Function B2_Onpessed;
  Function B3_Onpessed;

  ButtonsRow(this.B1_title,this.B1_Onpessed,this.B2_title,this.B2_Onpessed,this.B3_title,this.B3_Onpessed);

  @override
  _ButtonsRowState createState() => _ButtonsRowState();
}

class _ButtonsRowState extends State<ButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet ? Container(
      width: MediaQuery.of(context).size.width,
      child: Row(children: <Widget>[
        TextButton(onPressed: widget.B1_Onpessed(), child: Text(widget.B1_title,style: TextStyle(fontSize:18,color: Colors.black54),)),
        Text("/"),
        TextButton(onPressed: widget.B2_Onpessed(), child: Text(widget.B2_title,style: TextStyle(fontSize:18,color: Colors.black54),)),
        Text("/"),
        TextButton(onPressed: widget.B3_Onpessed(), child: Text(widget.B3_title,style: TextStyle(fontSize:18,color: Colors.black54,),))
      ],),
    ) : Container(
      width: MediaQuery.of(context).size.width,
      child: Row(children: <Widget>[
        TextButton(onPressed: widget.B1_Onpessed(), child: Text(widget.B1_title,style: TextStyle(color: Colors.black54),)),
        Text("/"),
        TextButton(onPressed: widget.B2_Onpessed(), child: Text(widget.B2_title,style: TextStyle(color: Colors.black54),)),
        Text("/"),
        TextButton(onPressed: widget.B3_Onpessed(), child: Text(widget.B3_title,style: TextStyle(color: Colors.black54,),))
      ],),
    );
  }
}
