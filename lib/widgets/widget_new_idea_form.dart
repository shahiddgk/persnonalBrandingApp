import 'package:flutter/cupertino.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/widget_date_picker.dart';

import 'TextFields/widget_title_field.dart';

class NewIdeaField extends StatefulWidget {
  TextEditingController titleFieldController;
  TextEditingController industryFieldController;
  TextEditingController messageFieldController;
  TextEditingController dateFieldController;

  Function onTap;

  NewIdeaField({required this.titleFieldController,required this.industryFieldController,required this.messageFieldController,required this.dateFieldController,required this.onTap});

  @override
  _NewIdeaFieldState createState() => _NewIdeaFieldState();
}

class _NewIdeaFieldState extends State<NewIdeaField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        IndustryTitle(
          hint: "Title",
          controller:widget.titleFieldController,
        ),

        Industry(
          hint: "Target Industry",
          controller: widget.industryFieldController,
        ),

        MessageField(
          hint: "Description",
          controller: widget.messageFieldController,
        ),

        DateField(
          hint: "Date Picker Here",
          controller: widget.dateFieldController,
          onTap: () {
            widget.onTap();
          },
        ),
      ],
    );
  }
}
