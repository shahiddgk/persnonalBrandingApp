import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Biography/picture_detail.dart';
import 'package:personal_branding/Pages/Entrepreneur/project_Description_chat_screen.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/Headings/widget_text_partnership.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/TextFields/widget_title_field.dart';

// ignore: must_be_immutable
class Entrepreneur extends KFDrawerContent {

  @override
  _EntrepreneurState createState() => _EntrepreneurState();
}

class _EntrepreneurState extends State<Entrepreneur> {

  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();

  int _radioValue = 0;


   _handleRadioValueChange(int value) {

    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              // Row(
              //   children: <Widget>[
              //     ClipRRect(
              //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //       child: Material(
              //         shadowColor: Colors.transparent,
              //         color: Colors.transparent,
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.menu,
              //             color: Colors.black,
              //           ),
              //           onPressed: widget.onMenuPressed,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom:MediaQuery.of(context).size.height*1/70,),
                        child: Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("LET'S CHANGE THE WORLD TOGETHER"),

                            Heading2WithDescription("DREAM,EXPLORE,DISCOVER","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("YOUR STRPS TO CHNAGE THE WORLD",style: TextStyle(fontSize: 10),),
                                  TextButton(onPressed: (){}, child: Text("NEW IDEA",style: TextStyle(color: Colors.grey),))
                              ],),
                            ),

                            IndustryTitle(hint: "Title",controller: _nameFieldController,),

                            Industry(hint: "Target Industry",controller: _nameFieldController,),

                            MessageField(hint: "Description",controller: _messageFieldController,),

                            Industry(hint: "Date Picker Here",controller: _nameFieldController,),

                            Button(title: "Browse", onPressed: (){}, Width: 90),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(value: 0, groupValue: _radioValue, onChanged: _handleRadioValueChange(0)),
                                Text("Partnership",style: TextStyle(color: Colors.black87),),
                                Radio(value: 1, groupValue: _radioValue, onChanged: _handleRadioValueChange(1)),
                                Text("Investment Plan",style: TextStyle(color: Colors.black87),)

                                ],),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Button(title: "REGISTER",Width: 110,onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProjectDescriptionWithChatScreen()));},),
                                Button(title: "LOGIN",Width: 90,onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProjectDescriptionWithChatScreen()));},),

                              ],),
                            PartnerShipText()
                          ],
                        ),),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}