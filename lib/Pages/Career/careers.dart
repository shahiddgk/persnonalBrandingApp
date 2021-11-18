import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/widget_contacts_icon_description.dart';

// ignore: must_be_immutable
class Career extends KFDrawerContent {


  @override
  _CareerState createState() => _CareerState();
}

class _CareerState extends State<Career> {

  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/40,left: 10,right: 10),
                      child: Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("Career"),

                            Heading2WithDescription("Let keep in Touch","Description"),

                            ContactsIconDescription(Icons.mail_rounded, "Email", "123@gmail.com"),

                            Heading2("Drop Me A Line"),

                            NameField(hint: "Your Name",controller: _nameFieldController,),

                            EmailField(hint: "Your Email",controller: _emailFieldController,),

                            MessageField(hint: "Enter Message",controller: _messageFieldController,),

                            Button(title: "Say Hello",onPressed: (){},),
                          ],
                        ),),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}