import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AchievementImagesList extends StatefulWidget {

  List urlImages = [];

  AchievementImagesList(this.urlImages);

  @override
  _AchievementImagesListState createState() => _AchievementImagesListState();
}

class _AchievementImagesListState extends State<AchievementImagesList> {

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        body:Container(
      child: CarouselSlider.builder(
        itemCount: widget.urlImages.length,
        itemBuilder: (context, index, realIndex){
          final  urlImage = widget.urlImages[index].img;
          return buildImage(urlImage,index);
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: false,
          viewportFraction: 1,
         // autoPlayInterval: Duration(seconds: 4),
          onPageChanged: (index, reason) => setState(()=>activeIndex = index),
        ),
      ),
    ));
  }

  Widget buildImage(String urlImage, int index) => Container(
    color: Colors.grey,
    child: Container(
        alignment: Alignment.bottomLeft,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(
            image: NetworkImage(widget.urlImages[index].img),
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

}
