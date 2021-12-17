import 'package:flutter/cupertino.dart';

import 'Headings/widget_heading2.dart';
import 'Headings/widget_heading2withdescription.dart';

class ExpansionTileDetail extends StatefulWidget {

  String Description;

  ExpansionTileDetail({required this.Description});

  @override
  _ExpansionTileDetailState createState() => _ExpansionTileDetailState();
}

class _ExpansionTileDetailState extends State<ExpansionTileDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets
                .only(
                top:
                10),
            child: Heading2WithDescription(
                "Description",
                widget.Description)),
        Heading2(
            "Related Document"),
        Container(
            margin: const EdgeInsets
                .only(
                top:
                5),
            child: const Text(
                "add more documents")),

      ],
    );
  }
}
