
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/Headings/widget_related_topics.dart';
import 'package:personal_branding/widgets/Headings/widget_text_partnership.dart';
import 'package:personal_branding/widgets/TextFields/widget_chatScreen_message_box.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_title_field.dart';
import 'package:personal_branding/widgets/widget_chat_screen_textfield_button.dart';
import 'package:personal_branding/widgets/widget_date_picker.dart';

import '../register.dart';

class NewProjectIdea extends StatefulWidget {
  const NewProjectIdea({Key? key}) : super(key: key);

  @override
  _NewProjectIdeaState createState() => _NewProjectIdeaState();
}

class _NewProjectIdeaState extends State<NewProjectIdea> {

  TextEditingController _titleFieldController = TextEditingController();
  TextEditingController _industryNameController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();
  TextEditingController _dateFieldController = TextEditingController();

  String date = "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Idea"),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      IndustryTitle(hint: "Title",controller: _titleFieldController,),

                      Industry(hint: "Target Industry",controller: _industryNameController,),

                      MessageField(hint: "Description",controller: _messageFieldController,),

                      DateField(hint: "Date Picker Here",controller: _dateFieldController, onTap: (){
                        _selectDate(context);
                      },),

                      ButtonWithWidth(title: "Browse", onPressed: (){}, Width: 90),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Radio(value: 0, groupValue: _radioValue, onChanged: _handleRadioValueChange(0)),
                      //     Text("Partnership",style: TextStyle(color: Colors.black87),),
                      //     Radio(value: 1, groupValue: _radioValue, onChanged: _handleRadioValueChange(1)),
                      //     Text("Investment Plan",style: TextStyle(color: Colors.black87),)
                      //
                      //   ],),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          ButtonWithWidth(title: "SIGN UP",Width: 110,onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));},),
                          ButtonWithWidth(title: "SIGN IN",Width: 90,onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));

                          },),

                        ],),
                      PartnerShipText()
                    ],)
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        _dateFieldController.text = "${selectedDate}";
      });
  }
}
