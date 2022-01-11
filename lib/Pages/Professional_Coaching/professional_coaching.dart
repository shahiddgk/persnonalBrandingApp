
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/home.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/drawer.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_pictutre_professional_coaching.dart';
import 'package:responsive_framework/responsive_framework.dart';
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


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
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
        leading: MenuWidget(),
      ),
      body: SafeArea(
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
                                Heading1("MY GALLERY"),
                              Heading2WithDescription("JUST MY AWESOME SKILLS", "As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”“Create a vision and never let the environment, other people’s beliefs, or the limits of what has been done in the past shape your decisions.”"),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: videoID!,
                                      flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    ),
                                    liveUIColor: Colors.yellow,
                                    showVideoProgressIndicator: true,
                                  ),
                                  Text("Saturday / Nov 23,2021"),
                                  Text("This is Standard Post",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                  Container(margin:EdgeInsets.only(top: 10,bottom: 10),height: 7,width: 90,color: Colors.amber,),
                                  Text("As Tony Robbins says, ““Goals are like magnets. They’ll attract the things that make them come true.”",style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),

                                ],
                              )

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
      ),
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}


