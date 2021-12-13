import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class ProfessionalCoachingPictures extends StatefulWidget {

  // ignore: non_constant_identifier_names
  String Date;
  // ignore: non_constant_identifier_names
  String Description;
  String title;

  String url;

  Function facebook_Onpressed;
  Function twitter_Onpressed;
  Function linkedIn_Onpressed;
  Function youtube_Onpressed;
  Function googlePlus_Onpressed;

  ProfessionalCoachingPictures(this.url,this.Date,this.title,this.Description,this.facebook_Onpressed,this.twitter_Onpressed,this.youtube_Onpressed,this.googlePlus_Onpressed,this.linkedIn_Onpressed);


  @override
  _ProfessionalCoachingPicturesState createState() => _ProfessionalCoachingPicturesState();
}

class _ProfessionalCoachingPicturesState extends State<ProfessionalCoachingPictures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(left: 1,right: 1),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 20,
                child: Container(
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: widget.url,
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      liveUIColor: Colors.yellow,
                      showVideoProgressIndicator: true,
                    )),
              ),
              Expanded(
                  flex: 1 ,
                  child: Text(widget.Date)),
              Expanded(
                  flex: 1,
                  child: Text(widget.title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)),

              Container(margin:EdgeInsets.only(top: 10,bottom: 10),height: 7,width: 90,color: Colors.amber,),
              Expanded(flex:2,
                  child: Text(widget.Description,style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.justify,)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                  //  margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.facebook_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                  Container(
                  //  margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.twitter_Onpressed(), icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
                  Container(
                   // margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
                  Container(
                 //   margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
                  Container(
                    width: 10,
                    child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
                  // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                ],)
            ],) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 1/9000),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: widget.url,
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    liveUIColor: Colors.yellow,
                    showVideoProgressIndicator: true,
                  )),
              Text(widget.Date),
              Text(widget.title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              Container(margin:EdgeInsets.only(top: 10,bottom: 10),height: 7,width: 90,color: Colors.amber,),
              Text(widget.Description,style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    //  margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.facebook_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                  Container(
                    //  margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.twitter_Onpressed(), icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
                  Container(
                    // margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
                  Container(
                    //   margin: EdgeInsets.only(right: 10),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
                  Container(
                    width: 10,
                    child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
                  // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                ],)
            ],)
        ),
      ),
    );
  }
}
