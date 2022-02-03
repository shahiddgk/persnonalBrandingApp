import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Biography/biography_images_list.dart';
import 'package:personal_branding/Pages/Biography/biography_vedio_list.dart';
import 'package:personal_branding/Pages/Biography/picture_detail.dart';
import 'package:personal_branding/models/response/biography_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_biography_headings.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2_description_picure.dart';
import 'package:personal_branding/widgets/widget_biography_bullet_points.dart';
import 'package:personal_branding/widgets/widget_heading1_buttons_and_marquee.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../drawer.dart';
import '../home.dart';

// ignore: must_be_immutable
class Biography extends KFDrawerContent {
  @override
  _BiographyState createState() => _BiographyState();
}

class _BiographyState extends State<Biography>
    with SingleTickerProviderStateMixin {
  // List images = [
  //   Heading2WithDescriptionWiithImage("BUSINESS MASTERY", "We don’t live in the same world that we lived in at the beginning of this year… and if your business isn’t keeping up with this rapidly changing world, you risk being left behind.In this time of upheaval – during this economic winter – you can either get caught in the storm and suffer, or you can use this time to innovate, create and master your skill set to launch into a thriving and successful future.", "https://branding.ratedsolution.com/public/biography/1638002019_business-mastery.png",(){}),];
  String api_response = "";
  bool _isLoading = true;

  late List<BiographyReadResponse> biographyReadResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   //_getBiographyList();
  }

  _getBiographyList() {
    HTTPManager().Biography().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        biographyReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getBiographyList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
        child:Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
        //   bottom: TabBar(
        //     isScrollable: true,
        //     controller: controller,
        //     tabs: const [
        //       Tab(text: "BIOGRAPHY",),
        //       Tab(text: "ACHIEVEMENT",),
        //       Tab(text: "FUTURE\n GOALS",),
        //     ],),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        1 /
                                        20,
                                    left: 20,
                                    right: 20,
                                    bottom: MediaQuery.of(context).size.height *
                                        1 /
                                        70),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Heading1WithButtonAndMarquee("BIOGRAPHY","It is better to fail in originality than to succeed in imitation."),
                                        
                                        Heading2("Dr.Ahmed's Biography"),

                                        BiographyHeadings(BiographyHeading: "Dr.Ahmed In Short (Competencies and Accomplishments)",),

                                        BiographyBulletoints(Point: "Academic and Teaching",),
                                        BiographyBulletoints(Point: "Licensed Consultant - DOH",),
                                        BiographyBulletoints(Point: "Publication & Med Research",),
                                        BiographyBulletoints(Point: "Networking",),
                                        BiographyBulletoints(Point: "Leadership",),
                                        BiographyBulletoints(Point: "Business Owner (UAE & Others)",),
                                    
                                        BiographyHeadings(BiographyHeading: "MBBS (Egypt), DCH (UK), MRCP (Ireland)"),
                                        BiographyBulletoints(Point: "Managing Director of Hayat Health"),
                                        BiographyBulletoints(Point: "Consultant Pediatrician and Neonatologist"),
                                        BiographyBulletoints(Point: "Member of Royal College of Physicians (Ireland)"),
                                        BiographyBulletoints(Point: "Chairman of Abu Dhabi Pediatric Club (638 Members)"),
                                        BiographyBulletoints(Point: "Daman’s Second Opinion Physician for Home care"),

                                        BiographyHeadings(BiographyHeading: "Clinician"),
                                        BiographyBulletoints(Point: "MRCP Member of the Royal College of Physician in Ireland, since 1992"),
                                        BiographyBulletoints(Point: "Post graduate Qualification and Training in UK & Ireland (1986 onwards)"),
                                        BiographyBulletoints(Point: "Early adopter of new specialization “Neonatology” in 1988 (Dublin)"),
                                        BiographyBulletoints(Point: "Clinical Achievement of VLBW (Very Low Birth Weight) baby of 450 grams, who is now an engineer."),
                                        BiographyBulletoints(Point: "Currently, Senior Consultant Pediatric & Neonatology (Valid License)."),

                                    // ListView.builder(
                                    //   physics: const NeverScrollableScrollPhysics(),
                                    //         itemCount:
                                    //             biographyReadResponse.length,
                                    //         shrinkWrap: true,
                                    //         itemBuilder: (context, index) {
                                    //           return GestureDetector(
                                    //             onTap: () {
                                    //               // Navigator.of(context).push(
                                    //               //     MaterialPageRoute(
                                    //               //         builder: (context) =>
                                    //               //             PictureDetails()));
                                    //             },
                                    //             child: Container(
                                    //               width: MediaQuery.of(context)
                                    //                   .size
                                    //                   .width,
                                    //               child: Heading2WithDescriptionWiithImage(
                                    //                   biographyReadResponse[index]
                                    //                       .title,
                                    //                   biographyReadResponse[index]
                                    //                       .body,
                                    //                   biographyReadResponse[index]
                                    //                               .images
                                    //                               .length >
                                    //                           0
                                    //                       ? biographyReadResponse[
                                    //                               index].cover
                                    //                       : "",
                                    //                   () {
                                    //                     biographyReadResponse[
                                    //                     index].images != [] ?
                                    //                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BiographyImagesList(biographyReadResponse[index]
                                    //                         .images
                                    //                         .length >
                                    //                         0
                                    //                         ? biographyReadResponse[
                                    //                     index].images
                                    //                         : [],))) : Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BiographyVedioList(biographyReadResponse[index]
                                    //                         .video!=''
                                    //                         ? biographyReadResponse[
                                    //                     index].video
                                    //                         : '',)));
                                    //                   }),
                                    //             ),
                                    //           );
                                    //         },
                                    //     ),
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
              )));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}
