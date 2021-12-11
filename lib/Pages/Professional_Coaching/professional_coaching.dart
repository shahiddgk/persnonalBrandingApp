
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
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
  
  // ignore: non_constant_identifier_names
  List profile_coaching = [
    ProfessionalCoachingPictures("https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg", "Saturday / Nov 23,2021", "THIS IS A STANDARD POST", "Admin", (){}, (){}, (){},(){},(){}),
    ProfessionalCoachingPictures("https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg", "Saturday / Nov 23,2021", "THIS IS A STANDARD POST", "Admin", (){}, (){}, (){},(){},(){}),
    ProfessionalCoachingPictures("https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg", "Saturday / Nov 23,2021", "THIS IS A STANDARD POST", "Admin", (){}, (){}, (){},(){},(){})
  ];

  // late YoutubePlayerController _controller;
  // String? url = "https://www.youtube.com/watch?v=K1QICrgxTjA";
  //
  // void runYoutubeplayer(){
  //   _controller = YoutubePlayerController(
  //       initialVideoId: YoutubePlayer.convertUrlToId(url!,trimWhitespaces: true),
  //   );
  //
  // }
  
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
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Heading1("MY GALLERY"),
                              Heading2WithDescription("JUST MY AWESOME SKILLS", "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                              ResponsiveWrapper.of(context).isDesktop ?
                              Container(
                                child: GridView.builder(
                                    shrinkWrap:true,
                                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 3/2,crossAxisSpacing: 10,mainAxisSpacing: 10, maxCrossAxisExtent: 800),
                                    itemCount: profile_coaching.length,
                                    itemBuilder: (context,index) {
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PictureDetails()));
                                        },
                                        child: profile_coaching[index],
                                      );
                                    }),
                              ) :
                              Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: profile_coaching.length,
                                    itemBuilder:(context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PictureDetails()));
                                        },
                                        child: profile_coaching[index],
                                      );
                                    } ),
                              ),
                              Container(

                              )
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
    );
  }
}


