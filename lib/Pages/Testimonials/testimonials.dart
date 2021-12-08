import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Testimonials/new_idea.dart';
import 'package:personal_branding/models/response/testimonials_response_list.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_testimonial_picture_details.dart';

// ignore: must_be_immutable
class Testimonials extends KFDrawerContent {


  @override
  _TestimonialsState createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  TextEditingController _organizatonController = new TextEditingController();
  TextEditingController _targetIndustryController = new TextEditingController();
  TextEditingController _messageController = new TextEditingController();

  late TestimonialsReadResponse testimonialsReadResponse;

  String api_response = "";
  bool _isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getTestimonialsList();
  }


  _getTestimonialsList() {
    HTTPManager().testimonials().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        testimonialsReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, (){
        setState(() {
          _isLoading = false;
        });
      }, (){
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),child:
                      Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("TESTIMONIAL"),

                            Heading2WithDescription("JUST MY EDUCATION","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                            Align(alignment: Alignment.centerRight,child: TextButton(child:Text("YOUR THOUGHTS",style: TextStyle(color: Colors.grey),) ,onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewIdea()));
                            },)),
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
      ),
    );
  }
}