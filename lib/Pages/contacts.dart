import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/widget_contacts_icon_description.dart';

// ignore: must_be_immutable
class Contacts extends KFDrawerContent {


  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Heading1("CONTACTS"),

                              Heading2WithDescription("LET KEEP IN TOUCH","Direct all organizational operations, policies, and objectives to maximize productivity and returns.Analyze complex scenarios and use creative problem-solving to turn challenges into profitable opportunities"),

                              ContactsIconDescription(Icons.location_on_sharp, "ANDREW SMITH", "Peshawer Pakistan",Icons.email, "Email", "abc@gmail.com", Icons.phone, "Phone", "123456789", "I'm also on Social Networks","Lorem Ipsum is simply dummy text of the printing and typesetting industry.",(){},(){},(){},(){},(){}),

                              Heading2("DROP ME A LINE"),

                              NameField(hint: "Your Name",controller: _nameFieldController,),

                              EmailField(hint: "Your Email",controller: _emailFieldController,),

                              MessageField(hint: "Enter Message", controller: _messageFieldController,),

                              Button(title: "SAY HELLO",Width: MediaQuery.of(context).size.width,onPressed: (){},),
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