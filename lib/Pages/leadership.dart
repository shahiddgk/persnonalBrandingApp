import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/constants/firestore_constants.dart';
import 'package:personal_branding/drawer.dart';
import 'package:personal_branding/models/response/testimonials_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_biography_bullet_points.dart';
import 'package:personal_branding/widgets/widget_eye_with_name.dart';
import 'package:personal_branding/widgets/widget_heading1_buttons_and_marquee.dart';
import 'package:personal_branding/widgets/widget_leadership.dart';
import 'package:personal_branding/widgets/widget_percentage_bar.dart';
import 'package:personal_branding/widgets/widget_testimonial_picture_details.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'login.dart';

class Leadership extends StatefulWidget {

  @override
  _LeadershipState createState() => _LeadershipState();
}

class _LeadershipState extends State<Leadership> {


  bool _isCheckingSession = true;
  bool _isLoading = true;
  bool _isLoadingData = true;
  List EyeName = [
    EyeWithName(Name: 'Displays integrity',),
    EyeWithName(Name: 'Holds themselves accountability',),
    EyeWithName(Name: 'Promotes a vision',),
    EyeWithName(Name: 'Helps others develop',),
    EyeWithName(Name: 'Shows honesty',),
    EyeWithName(Name: 'Displays courage',),
    EyeWithName(Name: 'Values relationships',),
    EyeWithName(Name: 'Practices active listening',),
    EyeWithName(Name: 'confronting conflicts',),
  ];
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //late List<TestimonialsReadResponse> testimonialsReadResponse;
  List <IconData>IconsList = [FontAwesomeIcons.paperPlane,FontAwesomeIcons.briefcase,FontAwesomeIcons.hospital,FontAwesomeIcons.shieldAlt,FontAwesomeIcons.arrowsAlt,FontAwesomeIcons.industry,FontAwesomeIcons.addressBook,FontAwesomeIcons.ambulance,FontAwesomeIcons.archive,FontAwesomeIcons.blog];

  //double percent = 90;

  Future _checkedLogin() async {
    await getUserSession().then((value) => {
      if (value.id == 0)
        {
          setState(() {
            _isCheckingSession = false;
            _isLoading = false;
          })
        }
      else
        {
          setState(() {
            _isCheckingSession = false;
            globalSessionUser = value;
            _isLoading = false;
          }),
        }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkedLogin();
   // _getTestimonialsList();
  }

  // _getTestimonialsList() {
  //   HTTPManager().Testimonials().then((value) {
  //     setState(() {
  //
  //       print(value);
  //       testimonialsReadResponse = value;
  //       _isLoadingData = false;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //     showAlert(context, e.toString(), true, () {
  //       setState(() {
  //         _isLoadingData = false;
  //       });
  //     }, () {
  //       _getTestimonialsList();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading == false
              && _isCheckingSession == false
              && globalSessionUser.id != 0 ?
          IconButton(onPressed: (){
            setState(() {
              _isLoading = true;
            });
            // FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${globalSessionUser.id}").update(
            //     {
            //       'Token': ' '
            //     }
            // );
            googleSignIn.signOut();
            googleSignIn.disconnect();
            FacebookAuth.i.logOut();
            logoutSessionUser().then((value) => {
              setState(() {
                globalSessionUser = value;
                _isLoading = false;
              })
            });
          },icon: const Icon(Icons.logout),) :
          Row(
            children: <Widget>[
              Container(
                height: 35,
                child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));}, child: const Text("SIGN UP ",style: TextStyle(color: Colors.black),),
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
              const Text(" | ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 5),
                height: 35,
                child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));}, child: const Text("SIGN IN ",style: TextStyle(color: Colors.black),),
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
            ],)
        ],
        centerTitle: true,
        title: _isLoading == false &&
            _isCheckingSession == false &&
            globalSessionUser.token != ""? Text("Welcome ${globalSessionUser.name}") : null,
      //  leading: MenuWidget(),
      ),
      body: _isLoading == false ? SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Heading1WithButtonAndMarquee("LEADERSHIP SKILLS","Success is where preparation and opportunity meet."),
                  Heading1("LEADERSHIP"),

                  Heading2("40+ YEARS EXPERIENCE"),

                  LeadershipIconsWithDetail(IconsList[0], "Chief", "Ped. Department", BiographyBulletoints(Point: "For more than 25 Years served as cheif of Ped. Department in different countries (KSA, Kuwait, Egypt, Bahrain and UAE).",)),

                  LeadershipIconsWithDetail(IconsList[1], "Medical Director 1996-2012", "Medical Complex",Column(
                    children: [
                      BiographyBulletoints(Point:"KSA - (1996-1998) Daghastani Hospital"),
                      BiographyBulletoints(Point: "UAE - (2006-2008) Mazrouie Medical Center (In one year, I have transformed it into a One-Day Surgery)"),
                      BiographyBulletoints(Point: "UAE – (2008 – 2012) Reem Ireland Medical Complex")
                    ],
                  )),
                  LeadershipIconsWithDetail(IconsList[2], "Founder and CEO 1998 - 2001", "TIBA Hospital", BiographyBulletoints(Point: " Alexandria (the first hospital in Alexandria specialized in Ped & Obstetrics).",)),
                  LeadershipIconsWithDetail(IconsList[3], "Founder 2012 - 2020", "Pyramids Group",Column(
                    children: [
                      BiographyBulletoints(Point:"2012 established Pyramids Health Services (PHS)."),
                      BiographyBulletoints(Point: "Within 4 years, two more companies were established PDC & PRC (Pyramids Dialysis Center and Ability Pediatric Rehabilitation Center)."),
                      BiographyBulletoints(Point: "2017 “Pyramids Holding” was established to own the three companies "),
                      BiographyBulletoints(Point: "2020, Ghobash acquired 70% of the group and is now called “Hayat Health” ")
                    ],
                  )),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: testimonialsReadResponse.length,
                  //   itemBuilder: (context,index) {
                  //     return testimonialPictureDetails(IconsList[index], testimonialsReadResponse[index].profession, testimonialsReadResponse[index].companyName, testimonialsReadResponse[index].description);
                  //   },
                  // )

                  // ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet ? GridView.builder(
                  //     shrinkWrap: true,
                  //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //     maxCrossAxisExtent: 200,
                  //     childAspectRatio: 3 / 2,
                  //     crossAxisSpacing: 20,
                  //     mainAxisSpacing: 20),
                  //     itemBuilder: (context, index) {
                  //       return EyeName[index];
                  //      }) : ListView.builder(
                  //   itemCount: EyeName.length,
                  //   shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemBuilder: (context,index){
                  //       return EyeName[index];
                  //     })
                      ],
                    ),),
                  ],
                 ),),
              )
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
