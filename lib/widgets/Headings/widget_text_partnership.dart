import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerShipText extends StatefulWidget {

  @override
  _PartnerShipTextState createState() => _PartnerShipTextState();
}

class _PartnerShipTextState extends State<PartnerShipText> {
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.only(top: 10,bottom: 10),child: Center(child: Text("Please Register or login to submit proposal!",style: TextStyle(color: Colors.black54),),),);
  }
}
