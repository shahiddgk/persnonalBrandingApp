import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/models/response/career_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_heading1_buttons_and_marquee.dart';
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

  late List<CareerReadResponse> careerReadResponse;

  String api_response = "";
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getCareersList();
  }

  _getCareersList() {
    HTTPManager().Careers().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        careerReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getCareersList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      // ),
      body: _isLoading == false ? SafeArea(
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
                              Heading1WithButtonAndMarquee("CAREER"),

                              Heading2WithDescription("LET KEEP IN TOUCH","Direct all organizational operations, policies, and objectives to maximize productivity and returns.Analyze complex scenarios and use creative problem-solving to turn challenges into profitable opportunities.Interview, appoint, train, and assign responsibilities to department managers.Monitor cost-effectiveness of operations and personnel using quantitative data, offering feedback and making cuts where necessaryCoordinate and approve budgets for product development, marketing, overhead, and growth. "),

                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: careerReadResponse.length,
                                itemBuilder: (context,index) {
                                  return IconDescription(careerReadResponse[index].image,careerReadResponse[index].profession,careerReadResponse[index].companyName,careerReadResponse[index].duration,careerReadResponse[index].description);
                                },
                              )
                            ],
                          ),),)
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

  // Future<bool> _onWillPop() async {
  //   return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  // }
}