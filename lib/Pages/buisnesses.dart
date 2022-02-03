import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Testimonials/new_idea.dart';
import 'package:personal_branding/models/response/testimonials_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_biography_bullet_points.dart';
import 'package:personal_branding/widgets/widget_buisness_image.dart';
import 'package:personal_branding/widgets/widget_heading1_buttons_and_marquee.dart';
import 'package:personal_branding/widgets/widget_testimonial_picture_details.dart';

import '../../drawer.dart';

// ignore: must_be_immutable
class Businesses extends KFDrawerContent {


  @override
  _BusinessesState createState() => _BusinessesState();
}

class _BusinessesState extends State<Businesses> {
  TextEditingController _organizatonController = new TextEditingController();
  TextEditingController _targetIndustryController = new TextEditingController();
  TextEditingController _messageController = new TextEditingController();

  late List<TestimonialsReadResponse> testimonialsReadResponse;
  List <IconData>IconsList = [FontAwesomeIcons.paperPlane,FontAwesomeIcons.briefcase,FontAwesomeIcons.hospital,FontAwesomeIcons.shieldAlt,FontAwesomeIcons.arrowsAlt,FontAwesomeIcons.industry,FontAwesomeIcons.addressBook,FontAwesomeIcons.ambulance,FontAwesomeIcons.archive,FontAwesomeIcons.blog];


  String api_response = "";
  bool _isLoading = true;
  bool _isLoadingData = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //_getTestimonialsList();
  }


  _getTestimonialsList() {
    HTTPManager().Testimonials().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        testimonialsReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getTestimonialsList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),child:
                        Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Heading1WithButtonAndMarquee("Businesses Outside UAE","The way to get started is to quit talking and begin doing."),

                              //Heading2WithDescription("TRUSTED PERSONALITIES AROUND THE WORLD","Dr.Ahmed Hussein have decades of experience in Pediatrics and Neonatology. He has an outstanding track record as clinician as well as business leader. Manages three subsidiaries - Pyramids Health Services, Ability Pediatric Rehabilitation Medical Center, Pyramids Dialysis Center."),
                              // Align(alignment: Alignment.centerRight,child: TextButton(child:Text("YOUR THOUGHTS",style: TextStyle(color: Colors.grey),) ,onPressed: (){
                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>NewIdea()));
                              // },)),

                              buisnessPictureDetails("https://dr.ratedsolution.com/public/images/egypt.png", "Founder & CEO Projects in pipeline", "Egypt", Column(children: [
                                BiographyBulletoints(Point:  "Founder and CEO of TIBA Hospital  (the first Specialized Hospital in Alexandria for Pediatric & Obstetrics) 1998 – 2001.",),
                                BiographyBulletoints(Point:  " Industry of Real-estate Development (Talent, One and Sharm Henaish).",),
                                BiographyBulletoints(Point:  " In Partnership with ORA  (owned by Najeeb Saweeris) to develop 560 Acre in the Northern Cost of Egypt.",),
                                BiographyBulletoints(Point:  "Home care,Nursing Home, Health Care Projects in the Pipe-line ",),
                              ],)),

                              buisnessPictureDetails("https://dr.ratedsolution.com/public/images/ksa.png", "Home Care Project Future Plan", "Kingdom Of Saudi Arabia", Column(children: [
                                BiographyBulletoints(Point:  "Established a Home care Project  in KSA (Sada El Reaya) but was sold out in 2019. We plan to start it again with Hayat Health",),

                              ],)),

                              buisnessPictureDetails("https://dr.ratedsolution.com/public/images/moroco.png", "Shareholder", "Morocco", Column(children: [
                                BiographyBulletoints(Point:  "Health care General Hospital – 20-bedded ",),
                                BiographyBulletoints(Point:  "Insurance Medical and General",),
                                BiographyBulletoints(Point:  "Education  British School (Nursery to secondary),Business School (Canadian Universities affiliation)",),

                              ],)),

                              // ListView.builder(
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemCount: testimonialsReadResponse.length,
                              //   itemBuilder: (context,index) {
                              //     return testimonialPictureDetails(testimonialsReadResponse[index].image, testimonialsReadResponse[index].profession, testimonialsReadResponse[index].companyName, testimonialsReadResponse[index].description);
                              //   },
                              // )

                              //   testimonialPictureDetails("https://branding.ratedsolution.com/public/images/20211127071232.png", "SENIOR DESIGNER", "Sophia Antipolis innovative ecosystem", "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                              //   testimonialPictureDetails("https://branding.ratedsolution.com/public/images/20211127071232.png", "SENIOR DESIGNER", "Sophia Antipolis innovative ecosystem", "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
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
        )
    );
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}