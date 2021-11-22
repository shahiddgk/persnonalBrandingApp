import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  Widget Child;

  ChatBox(this.Child);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 370,color: Colors.white,width: MediaQuery.of(context).size.width,child: widget.Child,);
  }
}
