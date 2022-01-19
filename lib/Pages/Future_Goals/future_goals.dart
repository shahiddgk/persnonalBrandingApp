import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/models/response/future_goals_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2_description_picure.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_heading1_buttons_and_marquee.dart';

import '../../drawer.dart';
import '../home.dart';
import 'future_picture_details.dart';

// ignore: must_be_immutable
class FutureGoals extends KFDrawerContent {

  @override
  _FutureGoalsState createState() => _FutureGoalsState();
}

class _FutureGoalsState extends State<FutureGoals> {

  // List images = [Heading2WithDescriptionWiithImage("Dream Big and Bold", "As Tony Robbins says, Goals are like magnets. They’ll attract the things that make them come true.Create a vision and never let the environment, other people’s beliefs, or the limits of what has been done in the past shape your decisions.", "https://branding.ratedsolution.com/public/futuregoal/1637941282_future-goals.png", (){}),
  //   Heading2WithDescriptionWiithImage("Dream Big and Bold", "As Tony Robbins says, Goals are like magnets. They’ll attract the things that make them come true.Create a vision and never let the environment, other people’s beliefs, or the limits of what has been done in the past shape your decisions.", "https://branding.ratedsolution.com/public/biography/1637939722_Tony_Robbins.png", (){}),];

  late List<FutureGoalsReadResponse> futureGoalsReadResponse;
  String api_response = "";
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFutureGoalsList();
  }

  _getFutureGoalsList() {
    HTTPManager().FutureGoals().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        futureGoalsReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getFutureGoalsList();
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
      // ),
      body: _isLoading==false ? SafeArea(
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),child:
                      Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1WithButtonAndMarquee("FUN & ACTIVITIES"),

                           // Heading2WithDescription("OUR PORTFOLIO","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

                            Container(
                              child: ListView.builder(itemCount: futureGoalsReadResponse.length,
                                  shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FutureGoalsPictureDetails()));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Heading2WithDescriptionWiithImage(futureGoalsReadResponse[index].title, futureGoalsReadResponse[index].body, futureGoalsReadResponse[index].images.length>0?futureGoalsReadResponse[index].cover:"",() {

                                        }),
                                      ),
                                    );
                                  },),
                            ),
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