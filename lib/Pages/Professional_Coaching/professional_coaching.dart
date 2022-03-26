
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/home.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/drawer.dart';
import 'package:personal_branding/models/response/gallery_resaponse_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_heading1_buttons_and_marquee.dart';
import 'package:personal_branding/widgets/widget_pictutre_professional_coaching.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'details_page.dart';

// ignore: must_be_immutable
class ProfessionalCoaching extends KFDrawerContent {


  @override
  _ProfessionalCoachingState createState() => _ProfessionalCoachingState();
}

class _ProfessionalCoachingState extends State<ProfessionalCoaching> {

  static String? videoID = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=linlz7-Pnvw");

  bool _isCheckingSession = true;
  bool _isLoading = true;
  bool _isLoadingData = true;
  int activeIndex = 0;

  late List<GalleryReadResponse> galleryReadResponse;
  CarouselSliderController _sliderController = CarouselSliderController();

  final urlImages = [
    "images/profile1.jpg","images/profile3.jpg","images/profile2.jpg"
  ];

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID!,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  
  // ignore: non_constant_identifier_names
  List profile_coaching = [
    ProfessionalCoachingPictures(videoID!, "Saturday / Nov 23,2021", "THIS IS A STANDARD POST", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", (){}, (){}, (){},(){},(){}),
    ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkedLogin();
    _getGalleryList();
  }

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

  _getGalleryList() {
    HTTPManager().Gallery().then((value) {
      setState(() {
        _isLoadingData = false;
        print(value);
        galleryReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoadingData = false;
        });
      }, () {
        _getGalleryList();
      });
    });
  }


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
       // leading: MenuWidget(),
      ),
      body:_isLoadingData == false ? SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Heading1WithButtonAndMarquee("GALLERY","Opportunities don't happen. You create them."),
                             // Heading2WithDescription("JUST MY AWESOME SKILLS", "As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”“Create a vision and never let the environment, other people’s beliefs, or the limits of what has been done in the past shape your decisions.”"),

                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     YoutubePlayer(
                              //       controller: YoutubePlayerController(
                              //         initialVideoId: videoID!,
                              //         flags: YoutubePlayerFlags(
                              //           autoPlay: false,
                              //           mute: false,
                              //         ),
                              //       ),
                              //       liveUIColor: Colors.yellow,
                              //       showVideoProgressIndicator: true,
                              //     ),
                              //     Text("Saturday / Nov 23,2021"),
                              //     Text("This is Standard Post",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              //     Container(margin:EdgeInsets.only(top: 10,bottom: 10),height: 7,width: 90,color: Colors.amber,),
                              //     Text("As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”",style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
                              //
                              //   ],
                              // )

                              ListView.builder(
                                  itemCount: galleryReadResponse.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context , index){
                                return Container(
                                    margin: EdgeInsets.only(top: 40),
                                    child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Heading2(galleryReadResponse[index].title),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width,
                                      height:  MediaQuery.of(context).size.height/5,
                                      child: Stack(
                                        children: [

                                          // Container(
                                          //   child: Image.network(galleryReadResponse[index].images[0].img),
                                          // ),

                                          CarouselSlider.builder(
                                            controller: _sliderController,
                                            itemCount: galleryReadResponse[index].images.length,
                                          slideBuilder: (count){
                                              final urlImage = galleryReadResponse[index].images[count].img;
                                              print(urlImage);
                                              return buildImage(urlImage,count);
                                          },
                                            slideIndicator: CircularSlideIndicator(
                                              currentIndicatorColor: Colors.blue,
                                              padding: EdgeInsets.only(bottom: 10)
                                            ),
                                            initialPage: 0,
                                          ),

                                          Container(margin:EdgeInsets.only(left: 5),child: Align(alignment: Alignment.centerLeft,
                                                child: IconButton(icon: Icon(Icons.arrow_back_ios),color: Colors.black, onPressed: () {_sliderController.previousPage();},),)),
                                          Container(margin:EdgeInsets.only(right: 5),child: Align(alignment: Alignment.centerRight,
                                                child: IconButton(color: Colors.black, icon: Icon(Icons.arrow_forward_ios), onPressed: () { _sliderController.nextPage();},),)),
                                        ],
                                      ),
                                    ),
                                    Container(height:30,color:Colors.black,child: Center(child: Text(galleryReadResponse[index].title,style: TextStyle(color: Colors.white,fontSize: 15),),),),
                                   // Padding(padding:EdgeInsets.only(bottom: 10),child: Align(alignment: Alignment.bottomCenter,child: buildIndicator())),
                                  ],
                                ));
                              }),

                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Heading2("Pyramids History"),
                              //     Container(
                              //       margin: EdgeInsets.only(top: 10),
                              //       width: MediaQuery.of(context).size.width,
                              //       height:  MediaQuery.of(context).size.height/3,
                              //       child: CarouselSlider.builder(
                              //         itemCount: urlImages.length,
                              //         itemBuilder: (context, index, realIndex){
                              //           final  urlImage = urlImages[index];
                              //           return buildImage(urlImage,index);
                              //         },
                              //         options: CarouselOptions(
                              //           height: MediaQuery.of(context).size.height,
                              //           viewportFraction: 1,
                              //           autoPlayInterval: Duration(seconds: 4),
                              //           onPageChanged: (index, reason) => setState(()=>activeIndex = index),
                              //         ),
                              //       ),
                              //     ),
                              //     Container(height:30,color:Colors.black,child: Center(child: Text("Pyramids History",style: TextStyle(color: Colors.white,fontSize: 15),),),),
                              //     Padding(padding:EdgeInsets.only(bottom: 10),child: Align(alignment: Alignment.bottomCenter,child: buildIndicator())),
                              //   ],
                              // )

                              // ResponsiveWrapper.of(context).isDesktop ?
                              // Container(
                              //   child: GridView.builder(
                              //       shrinkWrap:true,
                              //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 3/2,crossAxisSpacing: 10,mainAxisSpacing: 10, maxCrossAxisExtent: 800),
                              //       itemCount: profile_coaching.length,
                              //       itemBuilder: (context,index) {
                              //         return GestureDetector(
                              //           onTap: (){
                              //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PictureDetails()));
                              //           },
                              //           child: profile_coaching[index],
                              //         );
                              //       }),
                              // ) :
                              // Container(
                              //   child: ListView.builder(
                              //     physics: NeverScrollableScrollPhysics(),
                              //       scrollDirection: Axis.vertical,
                              //       shrinkWrap: true,
                              //       itemCount: profile_coaching.length,
                              //       itemBuilder:(context, index) {
                              //         return GestureDetector(
                              //           onTap: (){
                              //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PictureDetails()));
                              //           },
                              //           child: profile_coaching[index],
                              //         );
                              //       } ),
                              // ),
                             // ProfessionalCoachingPictures(videoID!, "Saturday / Nov 23,2021", "THIS IS A STANDARD POST", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", (){}, (){}, (){},(){},(){}),
                            ],
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ) : const Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: urlImages.length,
    effect: JumpingDotEffect(
      dotColor: Colors.grey,
      dotWidth: 10,dotHeight: 10,
    ),
  );

  Widget buildImage(String urlImage, int index) => Stack(
    children: [
      Container(
          alignment: Alignment.bottomLeft,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(image: DecorationImage(
          //     image: NetworkImage(urlImage[index]),
          //     fit: BoxFit.fill
          // )
          // ),
          child: Image.network(urlImage,fit: BoxFit.cover,)
      ),
      ],
  );

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}


