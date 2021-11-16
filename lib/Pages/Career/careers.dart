import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/widget_button.dart';
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
                    Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1,left: 10,right: 10),
                      child: Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("Career"),

                            Container(margin:EdgeInsets.only(top: 18),height: 7,width: 90,color: Colors.amberAccent,),

                            Heading2("Let keep in Touch"),
                            Text("Description"),
                            ContactsIconDescription(Icons.mail_rounded, "Email", "123@gmail.com"),

                            Heading2("Drop Me A Line"),

                            Container(margin: EdgeInsets.only(top: 20),child: NameField(hint: "Your Name",controller: _nameFieldController,)),

                            Container(margin: EdgeInsets.only(top: 20), child: EmailField(hint: "Your Email",controller: _emailFieldController,)),

                            Container(margin: EdgeInsets.only(top: 20),child: MessageField(hint: "Enter Message",controller: _messageFieldController,)),

                            Container(margin: EdgeInsets.only(top: 20),child: Button(title: "Say Hello",onPressed: (){},)),
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