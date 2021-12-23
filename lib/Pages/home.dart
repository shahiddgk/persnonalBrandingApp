import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  final urlImages = [
    "images/1.JPG","images/2.JPG","images/5.JPG"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
              child: CarouselSlider.builder(
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex){
                  final  urlImage = urlImages[index];
                  return buildImage(urlImage,index);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: Duration(seconds: 4),
                  onPageChanged: (index, reason) => setState(()=>activeIndex = index),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Align(alignment:Alignment.bottomLeft,child: Container(child: Text("Hello, I'M",style: TextStyle(color: Colors.white,fontSize: 22),))),
                    Align(alignment:Alignment.bottomLeft,child: Container(child: Text("DR.AHMED HUSSAIN",style: TextStyle(color: Colors.white,fontSize: 22),))),
                    Align(alignment:Alignment.bottomLeft,child: Container(child: Text("ENTREPRENUR/INFLUENCER",style: TextStyle(color: Colors.white,fontSize: 10),))),

                  ],
                ),
            ),
            Padding(padding:EdgeInsets.only(bottom: 10),child: Align(alignment: Alignment.bottomCenter,child: buildIndicator())),
          ],
        ),
      )
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    color: Colors.grey,
    child: Container(
        alignment: Alignment.bottomLeft,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage(urlImages[index]),
            fit: BoxFit.cover
        )
       ),
      child: Column(
      // children: [
      //   Image.asset("1.JPG"),
      // ],
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
    )),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: urlImages.length,
    effect: JumpingDotEffect(
      dotColor: Colors.white,
      dotWidth: 10,dotHeight: 10,
    ),
  );
}
