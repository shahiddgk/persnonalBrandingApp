import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureGoalsImagesList extends StatefulWidget {

  dynamic urlImages ;

  FutureGoalsImagesList(this.urlImages);

  @override
  _FutureGoalsImagesListState createState() => _FutureGoalsImagesListState();
}

class _FutureGoalsImagesListState extends State<FutureGoalsImagesList> {

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(),
        body:Container(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
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
