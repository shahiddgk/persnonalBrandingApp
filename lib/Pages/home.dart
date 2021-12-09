import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  final urlImages = [
    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F08%2F12%2Fdavid-beckham.jpg',
    'https://media.gq.com/photos/56e85846239f13cf5b2ba1a8/master/w_1953,h_2929,c_limit/David-Beckham-Style-2015-07-09-15.jpg',
    'https://naijasuperfans.com/wp-content/uploads/2021/10/46382923-9870415-image-a-12_1628284332538.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      ),
      body: Stack(
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

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Align(alignment:Alignment.bottomLeft,child: Container(child: Text("Hello, I'M",style: TextStyle(color: Colors.white,fontSize: 22),))),
                Align(alignment:Alignment.bottomLeft,child: Container(child: Text("DR.AHMED HUSSAIN",style: TextStyle(color: Colors.white,fontSize: 22),))),
                Align(alignment:Alignment.bottomLeft,child: Container(child: Text("ENTREPRENUR/INFLUENCER",style: TextStyle(color: Colors.white,fontSize: 10),))),

              ],
            ),
          Align(alignment: Alignment.bottomCenter,child: buildIndicator()),
        ],
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
            image: NetworkImage(urlImage,),
            fit: BoxFit.cover
        )),child: Column(
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
