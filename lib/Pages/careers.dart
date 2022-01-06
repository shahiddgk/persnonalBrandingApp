import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_icon_with_description.dart';

import '../drawer.dart';

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
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      // ),
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Heading1("CAREER"),

                              Heading2WithDescription("LET KEEP IN TOUCH","Direct all organizational operations, policies, and objectives to maximize productivity and returns.Analyze complex scenarios and use creative problem-solving to turn challenges into profitable opportunities.Interview, appoint, train, and assign responsibilities to department managers.Monitor cost-effectiveness of operations and personnel using quantitative data, offering feedback and making cuts where necessaryCoordinate and approve budgets for product development, marketing, overhead, and growth. "),

                              // IconDescription("https://branding.ratedsolution.com/public/images/20211127071232.png", "Executive &amp; Entrepreneur", "Sophia Antipolis innovative ecosystem", "October 2007 – November 2014","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                              // IconDescription("https://branding.ratedsolution.com/public/images/20211127071554.png", "Business Development Consultant", "Cara Group", "May 2007 – Septrmber 2014","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
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
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}