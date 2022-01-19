import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/models/response/about_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_about_section_details.dart';

import '../drawer.dart';

// ignore: must_be_immutable
class About extends KFDrawerContent {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  late TabController controller;
  late AboutReadResponse aboutReadResponse;
  String api_response = "";
  bool _isLoading = true;
  bool _useRtlText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getAboutList();
  }

  _getAboutList() {
    HTTPManager().about().then((value) {
      setState(() {
        _isLoading = false;
        aboutReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, (){
        setState(() {
          _isLoading = false;
        });
      }, (){
        _getAboutList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      // appBar: AppBar(
      //  // leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      // ),
      body: _isLoading == false ?  SafeArea(
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
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[

                      const Padding(padding: EdgeInsets.only(right: 10,top: 10),
                      child: Align(
                          alignment:Alignment.topRight,
                          child: CircleAvatar(backgroundImage: AssetImage("images/2.JPG",),
                            radius: 60,)),
                      ),


                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              Heading1WithButton("ABOUT"),

                             // _buildMarquee(),

                              AboutSectionDetails(aboutReadResponse.name, aboutReadResponse.email, aboutReadResponse.phone, aboutReadResponse.dob, aboutReadResponse.address, aboutReadResponse.nationality),

                              Heading2WithDescription("PROFESSIONAL PROFILE",aboutReadResponse.statement),

                              Image.asset("images/sign.png"),

                              // Button(title: "Download Resume as PDF",onPressed: (){},)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ) : Container(child: Center(child: CircularProgressIndicator(),),)
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}