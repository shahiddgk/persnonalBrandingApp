import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Biography/picture_detail.dart';
import 'package:personal_branding/Pages/Entrepreneur/project_Description_chat_screen.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';

// ignore: must_be_immutable
class Entrepreneur extends KFDrawerContent {

  @override
  _EntrepreneurState createState() => _EntrepreneurState();
}

class _EntrepreneurState extends State<Entrepreneur> {

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
                          Heading1("Entrepreneur"),

                          Heading2WithDescription("Let keep in Touch","Description"),

                          Heading2("Drop  A Line"),
                          
                          NameField(hint: "Your Name",controller: _nameFieldController,),
                          
                          EmailField(hint: "Your Email",controller: _emailFieldController,),
                          
                          MessageField(hint: "Enter Message",controller: _messageFieldController,),
                          Container(child: TextButton(
                            onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProjectDescriptionWithChatScreen())); },
                            child: Text("New Page"),
                          ),),
                          
                          GestureDetector(
                            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProjectDescriptionWithChatScreen()));},
                              child: Button(title: "Say Hello",onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProjectDescriptionWithChatScreen()));},)),
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