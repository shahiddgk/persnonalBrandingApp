import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/models/response/about_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_about_section_details.dart';
import 'package:personal_branding/widgets/widget_biography_bullet_points.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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

                              Heading2("DR.AHMED HUSSEIN"),
                             Container(
                               margin:const EdgeInsets.only(top: 20,bottom: 10),
                               child:  ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Text("MBBS (Egypt), DCH (UK), MRCP (Ireland)",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)) : Container(
                                   margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.28),
                                   child:Text("MBBS (Egypt), DCH (UK), MRCP (Ireland)",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                             ),

                              Container(margin:EdgeInsets.only(top: 25,bottom: 25),height: 7,width: 100,color: Colors.amber,),

                             // AboutSectionDetails(aboutReadResponse.name, aboutReadResponse.email, aboutReadResponse.phone, aboutReadResponse.dob, aboutReadResponse.address, aboutReadResponse.nationality),

                              BiographyBulletoints(Point: "Managing Director of Hayat Health"),
                              BiographyBulletoints(Point: "Consultant Pediatrician and Neonatologist"),
                              BiographyBulletoints(Point: "Member of Royal College of Physicians (Ireland)"),
                              BiographyBulletoints(Point: "Chairman of Abu Dhabi Pediatric Club"),
                              BiographyBulletoints(Point: "Daman’s Second Opinion Physician for Home care"),
                              BiographyBulletoints(Point: "Business Owner (UAE and Others)"),

                               ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet ?
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child:Row(children: [
                                Image.network("https://dr.ratedsolution.com/public/images/ph.png"),
                                Image.network("https://dr.ratedsolution.com/public/images/phs.png"),
                                Image.network("https://dr.ratedsolution.com/public/images/pd.png"),
                              ],)) : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child:Row(children: [
                                    Image.network("https://dr.ratedsolution.com/public/images/ph.png",height: 100,width: 100,),
                                    Image.network("https://dr.ratedsolution.com/public/images/phs.png",height: 100,width: 100,),
                                    Image.network("https://dr.ratedsolution.com/public/images/pd.png",height: 100,width: 100,),
                                  ],))
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