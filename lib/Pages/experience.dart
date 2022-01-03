

import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/models/response/experience_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_icon_with_description.dart';


// ignore: must_be_immutable
class Experience extends KFDrawerContent {


  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {

  late List<ExperienceReadResponse> experienceReadResponse;

  String api_response = "";
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getExperienceList();
  }

  _getExperienceList() {
    HTTPManager().Experience().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        experienceReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getExperienceList();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      // ),
      body:_isLoading == false ? SafeArea(
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
                          Heading1("EXPERIENCE"),

                          Heading2WithDescription("14 YEARS EXPERIENCE","Direct all organizational operations, policies, and objectives to maximize productivity and returns.Analyze complex scenarios and use creative problem-solving to turn challenges into profitable opportunities"),

                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index) {
                                  return IconDescription(experienceReadResponse[index].image, experienceReadResponse[index].profession, experienceReadResponse[index].companyName, experienceReadResponse[index].duration, experienceReadResponse[index].description);
                                },
                                itemCount: experienceReadResponse.length,
                            ),
                          ),
                          // IconDescription("https://branding.ratedsolution.com/public/images/20211127071232.png", "Executive &amp; Entrepreneur", "Sophia Antipolis innovative ecosystem", "October 2007 – November 2014","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          // IconDescription("https://branding.ratedsolution.com/public/images/20211127071554.png", "Business Development Consultant", "Cara Group", "May 2007 – Septrmber 2014","Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
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
    );
  }
}