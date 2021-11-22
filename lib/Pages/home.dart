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
    'https://cutewallpaper.org/21/4k-wallpaper-for-android/Top-60-Most-Popular-Android-and-iPhone-4K-Wallpapers-Collection.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4AnDlL3JQvBXQ_7z-xTvY5LiYoiXK-DpH5g&usqp=CAU',
    'https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height*0.8,
                  child: CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex){
                      final  urlImage = urlImages[index];
                      return buildImage(urlImage,index);
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height-160,
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(seconds: 4),
                      onPageChanged: (index, reason) => setState(()=>activeIndex = index),
                    ),
                  ),
                ),
                Container(margin:EdgeInsets.only(top: 15),child: buildIndicator()),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    color: Colors.grey,
    child: Container(
        alignment: Alignment.bottomLeft,
        height: MediaQuery.of(context).size.height-160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(
            image: NetworkImage(urlImage,),
            fit: BoxFit.cover
        )),child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Align(alignment:Alignment.bottomLeft,child: Container(child: Text("Hello, I'M",style: TextStyle(color: Colors.white,fontSize: 22),))),
        Align(alignment:Alignment.bottomLeft,child: Container(child: Text("Kaleem Ullah Khan",style: TextStyle(color: Colors.white,fontSize: 22),))),
        Align(alignment:Alignment.bottomLeft,child: Container(child: Text("Flutter Developer",style: TextStyle(color: Colors.white,fontSize: 12),))),
      ],
    )),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: urlImages.length,
    effect: JumpingDotEffect(
      dotWidth: 10,dotHeight: 10,
    ),
  );
}
