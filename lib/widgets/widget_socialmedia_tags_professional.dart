import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SocialMediaTags extends StatefulWidget {


  Function facebook_Onpressed;
  Function twitter_Onpressed;
  Function linkedIn_Onpressed;
  Function youtube_Onpressed;
  Function googlePlus_Onpressed;

  SocialMediaTags(this.facebook_Onpressed,this.twitter_Onpressed,this.youtube_Onpressed,this.googlePlus_Onpressed,this.linkedIn_Onpressed);

  @override
  _SocialMediaTagsState createState() => _SocialMediaTagsState();
}

class _SocialMediaTagsState extends State<SocialMediaTags> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Column(
      children: [
        Container(height: 2,
          color: Colors.grey,
          margin: EdgeInsets.only(top:10,bottom: 10),),

        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  //margin: EdgeInsets.only(right: 17),
                  width: 10,
                  child: IconButton(onPressed: widget.facebook_Onpressed(), icon: Icon(Icons.facebook,size: 24,)),),
              ),
              Expanded(
                flex: 1,
                child: Container(
                 // margin: EdgeInsets.only(right: 17),
                  width: 10,
                  child: IconButton(onPressed: widget.twitter_Onpressed(), icon: FaIcon(FontAwesomeIcons.twitter,size: 24,)),),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  //margin: EdgeInsets.only(right: 17),
                  width: 10,
                  child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.youtube,size: 24,)),),
              ),
              Expanded(
                flex: 1,
                child: Container(
                 // margin: EdgeInsets.only(right: 17),
                  width: 10,
                  child: IconButton(onPressed: widget.googlePlus_Onpressed(), icon: FaIcon(FontAwesomeIcons.googlePlus,size: 24,)),),
              ),
              Expanded(
                flex: 1,
                child: Container(
                //  margin: EdgeInsets.only(right: 17),
                  width: 10,
                  child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 24,)),),
              ),
              // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
            ],),
        ),

        Container(height: 2,
          color: Colors.black,margin: EdgeInsets.only(bottom: 10),),
      ],
    ) : Column(
      children: [
        Container(height: 2,
          color: Colors.grey,
          margin: EdgeInsets.only(top:10,bottom: 10),),

        Container(
          width: MediaQuery.of(context).size.width,
          child: Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    //margin: EdgeInsets.only(right: 17),
                    width: 10,
                    child: IconButton(onPressed: widget.facebook_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //margin: EdgeInsets.only(right: 17),
                    width: 10,
                    child: IconButton(onPressed: widget.twitter_Onpressed(), icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //margin: EdgeInsets.only(right: 17),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //margin: EdgeInsets.only(right: 17),
                    width: 10,
                    child: IconButton(onPressed: widget.googlePlus_Onpressed(), icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //margin: EdgeInsets.only(right: 17),
                    width: 10,
                    child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
                ),
                // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
              ],),
          ),
        ),

        Container(height: 2,
          color: Colors.black,margin: EdgeInsets.only(bottom: 10),),
      ],
    );
  }
}
