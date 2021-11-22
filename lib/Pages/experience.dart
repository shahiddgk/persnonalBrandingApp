import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_icon_with_description.dart';

// ignore: must_be_immutable
class Experience extends KFDrawerContent {


  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 10,right: 10),child:
                      Align(alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Heading1("EXPERIENCE"),

                          Heading2WithDescription("14 YEARS EXPERIENCE","Description Paragraph"),

                          IconDescription(Icons.email, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.message, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.send, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.print, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.search, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.title, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.access_alarm, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.accessibility_new, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          IconDescription(Icons.accessible_sharp, "Ace Adevertising", "Project Manager", "2013-2011","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                        ],
                      ),
                      ),
                      ),
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