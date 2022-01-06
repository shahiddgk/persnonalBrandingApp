import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Headings/widget_text_partnership.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_title_field.dart';

class NewIdea extends StatefulWidget {
  const NewIdea({Key? key}) : super(key: key);

  @override
  _NewIdeaState createState() => _NewIdeaState();
}

class _NewIdeaState extends State<NewIdea> {

  TextEditingController _organizatonController = new TextEditingController();
  TextEditingController _targetIndustryController = new TextEditingController();
  TextEditingController _messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Idea"),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*1/40,left: 20,right: 20),
          child: Column(
            children: <Widget>[
              IndustryTitle(hint: "Provisional Idea Title",controller: _organizatonController,),

              Industry(hint: "Target Industry",controller: _targetIndustryController,),

              MessageField(hint: "Your Message",controller: _messageController,),

              Align(alignment:Alignment.centerLeft,child: ButtonWithWidth(title: "Browse", onPressed: (){}, Width: 90)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ButtonWithWidth(title: "SIGN UP",Width: 110,onPressed: (){},),
                  ButtonWithWidth(title: "SIGN IN",Width: 90,onPressed: () {},),

                ],),
              PartnerShipText(),
            ],
          ),
        ),
      ),
    );
  }
}
