import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/widget_icon_with_description.dart';

// ignore: must_be_immutable
class Testimonials extends KFDrawerContent {


  @override
  _TestimonialsState createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/40,left: 20,right: 20),child:
                    Align(alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Heading1("Testimonial"),

                          Container(margin:EdgeInsets.only(top: 25),height: 7,width: 90,color: Colors.amberAccent,),

                          Heading2("Just my education"),

                          Container(margin:EdgeInsets.only(top: 25),child: Text("Description Paragraph")),

                          IconDescription(Icons.email, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.message, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.send, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.print, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.search, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.title, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.access_alarm, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.accessibility_new, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
                          IconDescription(Icons.accessible_sharp, "Ace Adevertising", "Project Manager", "2013-2011","Description"),
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
    );
  }
}