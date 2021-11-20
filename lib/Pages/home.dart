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
                //     Spacer(),
                //
                //     Container(
                //       margin: EdgeInsets.only(right: 10),
                //       height: 40,
                //       width: 40,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           image: DecorationImage(
                //               image: AssetImage('images/image.jpg'),
                //               fit: BoxFit.cover)),
                //     ),
                //   ],
                // ),

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

                //Center(child: Text("Home"),),
                // Padding(
                //   padding: EdgeInsets.all(15),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Row(
                //         children: <Widget>[
                //           Text("Welcome", style: TextStyle(fontSize: 17)),
                //         ],
                //       ),
                //       SizedBox(height: 30),
                //       Text("Scarlett Johansson", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                //       SizedBox(height: 15),
                //       Text("Hey, Scarlett we allow you to handle your electronics from in or outside your house."
                //           " We recommend you to please read the instructions carefully and enjoy the luxury.", style: TextStyle(color: Colors.grey),),
                //       SizedBox(height: 30),
                //       Text("Rooms", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                //       SizedBox(height: 15),
                //       Container(
                //         height: 300,
                //         width: double.infinity,
                //         child: ListView(
                //           scrollDirection: Axis.horizontal,
                //           children: <Widget>[
                //             listItem('images/picture1.jpg'),
                //             new SizedBox(width: 15),
                //             listItem('images/picture1.jpg'),
                //             new SizedBox(width: 15),
                //             listItem('images/picture1.jpg'),
                //           ],
                //         )
                //       ),
                //       SizedBox(height: 15),
                //       Text("Stats", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                //     ],
                //   ),
                // ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 200,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(40),
                //       topRight: Radius.circular(40),
                //     ),
                //     color: Color.fromRGBO(31, 58, 47, 1.0),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       listItemStats('images/creative.png',"6 Lights",true),
                //       listItemStats('images/air-conditioner.png',"Air Conditioner", false),
                //       listItemStats('images/washing-machine.png',"Washing Machine", false)
                //     ],
                //   ),
                // ),
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
        SizedBox(height: 5,)
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

  // Widget listItem(String imgpath){
  //   return InkWell(
  //     onTap: (){
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => DetailPage(
  //               imgPath: imgpath,
  //               )));
  //     },
  //     child: Container(
  //       width: 325,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25),
  //         image: DecorationImage(image: AssetImage(imgpath),
  //         fit: BoxFit.cover
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget listItemStats(String imgpath, String name, bool value){
  //   return Container(
  //     width: 110,
  //     height: 150,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25),
  //         color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         SizedBox(height: 20),
  //         Image(image: AssetImage(imgpath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
  //         SizedBox(height: 15),
  //         Text(name, style: TextStyle(fontSize: 13, color: value == true ? Colors.black : Colors.white)),
  //         SizedBox(height: 5),
  //         Switch(
  //           value: value,
  //           onChanged: (newVal){
  //             setState(() {
  //               value = newVal;
  //               print(newVal);
  //             });
  //           },
  //           activeColor: Colors.green,
  //         )
  //       ],
  //     ),
  //   );
  // }
}
