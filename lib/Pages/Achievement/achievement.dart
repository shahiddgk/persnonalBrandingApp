import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Achievement/achievement_image_list.dart';
import 'package:personal_branding/Pages/home.dart';
import 'package:personal_branding/models/response/achievement_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2_description_picure.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';

import '../../drawer.dart';
import 'achievement_picture_details.dart';

// ignore: must_be_immutable
class Achievement extends KFDrawerContent {

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {

  // List images = [Heading2WithDescriptionWiithImage("LIFE OF DR.AHMED", "We don’t live in the same world that we lived in at the beginning of this year… and if your business isn’t keeping up with this rapidly changing world, you risk being left behind.In this time of upheaval – during this economic winter – you can either get caught in the storm and suffer, or you can use this time to innovate, create and master your skill set to launch into a thriving and successful future.", "https://branding.ratedsolution.com/public/biography/1637939722_Tony_Robbins.png", (){}),
  //   Heading2WithDescriptionWiithImage("BUSINESS MASTERY", "We don’t live in the same world that we lived in at the beginning of this year… and if your business isn’t keeping up with this rapidly changing world, you risk being left behind.In this time of upheaval – during this economic winter – you can either get caught in the storm and suffer, or you can use this time to innovate, create and master your skill set to launch into a thriving and successful future.", "https://branding.ratedsolution.com/public/biography/1638002019_business-mastery.png",(){}),];

  late List<AchievementsReadResponse> achievementReadResponse;

  String api_response = "";
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getAchievementList();
  }

  _getAchievementList() {
    HTTPManager().Achievement().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        achievementReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getAchievementList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onWillPop,
    child:Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      // ),
      body:_isLoading==false ? SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              // Row(
              //   children: <Widget>[
              //     ClipRRect(
              //       borderRadius: const BorderRadius.all(Radius.circular(32.0)),
              //       child: Material(
              //         shadowColor: Colors.transparent,
              //         color: Colors.transparent,
              //         child: IconButton(
              //           icon: const Icon(
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20),
                        child:
                      Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("ACHIEVEMENT"),

                            Heading2WithDescription("OUR PORTFOLIO","Tony’s 6 internationally best selling books, audio, video, and seminar trainings will empower you with the knowledge and tool you need to create lifelong success in life and business. More than 4 million people have attended Tony’s live seminars, and more than 50 million people from 100 countries have experienced the absolute power of his teachings, making him the #1 personal and professional development leader of all time.ypesetting industry."),

                            // Heading2WithDescriptionWiithImage(
                            //     "BESTSELLING BOOKS &amp; SOLD OUT SEMINARS",
                            //     "Dr. Ahemd is an Entrepreneur and a great  leader who helps Business, Big organizations, Individuals and  startups to build and get dreams true.Before Stating business, Kate spent six years as a Bank Teller and Virtual Assistant for financial companies in the U.S. and U.K. After a successful career helping small banks and real estate agencies, Katie now helps them write marketing copy for their products and services.Kate enjoys trying new sports (archery, anyone?) and managing a small property rental business.Kate’s available for marketing and writing projects, as well as private consultations. You can reach Kate at kate@domain.com.",
                            //     "https://branding.ratedsolution.com/public/achievement/1639227336_1 - Copy.JPG",
                            //         () {}),
                            // Heading2WithDescriptionWiithImage(
                            //     "ENDURING TRANSFORMATION",
                            //     "Dr. Ahemd is an Entrepreneur and a great  leader who helps Business, Big organizations, Individuals and  startups to build and get dreams true.Before Stating business, Kate spent six years as a Bank Teller and Virtual Assistant for financial companies in the U.S. and U.K. After a successful career helping small banks and real estate agencies, Katie now helps them write marketing copy for their products and services.Kate enjoys trying new sports (archery, anyone?) and managing a small property rental business.Kate’s available for marketing and writing projects, as well as private consultations. You can reach Kate at kate@domain.com.",
                            //     "https://branding.ratedsolution.com/public/achievement/1639227336_1 - Copy.JPG",
                            //         () {}),

                            Container(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: achievementReadResponse.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      child: Heading2WithDescriptionWiithImage(
                                          achievementReadResponse[index]
                                              .title,
                                          achievementReadResponse[index]
                                              .body,
                                          achievementReadResponse[index]
                                              .images
                                              .length >
                                              0
                                              ? achievementReadResponse[
                                          index].cover
                                              : "",
                                              () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AchievementImagesList(achievementReadResponse[index]
                                                .images
                                                .length >
                                                0
                                                ? achievementReadResponse[
                                            index].images
                                                : [],)));
                                              }),
                                    ),
                                  );
                                },),
                            )
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
      ) : Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      )
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}