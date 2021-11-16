import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/widget_button.dart';

// ignore: must_be_immutable
class About extends KFDrawerContent {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1,left: 10,right: 10),
                    child: Align(alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Heading1("About"),
                          Container(margin:EdgeInsets.only(top: 25),height: 7,width: 90,color: Colors.amberAccent,),
                          
                          Container(margin:EdgeInsets.only(top: 25),child: Text("• Name: Kaleem Ullah Khan",style: TextStyle(color: Colors.grey),)),
                          Text("• Email: ABCD@gmail.com",style: TextStyle(color: Colors.grey),),
                          Text("• Phone: 12345678901",style: TextStyle(color: Colors.grey),),
                          Text("• Date of Birth: 23 February 1990",style: TextStyle(color: Colors.grey),),
                          Text("• Address : Pakistan Peshawer",style: TextStyle(color: Colors.grey),),
                          Text("• Nationality: Pakistan",style: TextStyle(color: Colors.grey),),

                          Heading2("Professional Profile"),
                          Container(margin:EdgeInsets.only(top: 25),child: Text("Flutter Developer",style: TextStyle(color: Colors.grey))),

                          Container(
                              margin:EdgeInsets.only(top: 25),
                            width: 400,
                            decoration: BoxDecoration(border: Border.all(color: Colors.yellow,width: 3)),
                            child: Button(title: "Download Resume as PDF",onPressed: (){},)
                          )],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}