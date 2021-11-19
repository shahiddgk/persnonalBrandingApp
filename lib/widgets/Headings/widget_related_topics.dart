import 'package:flutter/cupertino.dart';

class RelatedTopics extends StatefulWidget {
  String Topic;
  RelatedTopics(this.Topic);

  @override
  _RelatedTopicsState createState() => _RelatedTopicsState();
}

class _RelatedTopicsState extends State<RelatedTopics> {
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.only(top: 10,left: 10),child: Text("✔  ${widget.Topic}"));
  }
}
