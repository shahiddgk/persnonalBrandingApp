import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Biography/picture_detail.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2_description_picure.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';

// ignore: must_be_immutable
class Biography extends KFDrawerContent {
  @override
  _BiographyState createState() => _BiographyState();
}

class _BiographyState extends State<Biography> {

  List images = [Heading2WithDescriptionWiithImage("LIFE OF DR.AHMED", "We don’t live in the same world that we lived in at the beginning of this year… and if your business isn’t keeping up with this rapidly changing world, you risk being left behind.In this time of upheaval – during this economic winter – you can either get caught in the storm and suffer, or you can use this time to innovate, create and master your skill set to launch into a thriving and successful future.", "https://branding.ratedsolution.com/public/biography/1637939722_Tony_Robbins.png", (){}),
    Heading2WithDescriptionWiithImage("BUSINESS MASTERY", "We don’t live in the same world that we lived in at the beginning of this year… and if your business isn’t keeping up with this rapidly changing world, you risk being left behind.In this time of upheaval – during this economic winter – you can either get caught in the storm and suffer, or you can use this time to innovate, create and master your skill set to launch into a thriving and successful future.", "https://branding.ratedsolution.com/public/biography/1638002019_business-mastery.png",(){}),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      ),
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
                            Heading1("BIOGRAPHY"),

                            //Heading2WithDescription("OUR PORTFOLIO","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

                            Container(

                              child: ListView.builder(itemCount: images.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PictureDetails()));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: images[index],
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
      ),
    );
  }
}