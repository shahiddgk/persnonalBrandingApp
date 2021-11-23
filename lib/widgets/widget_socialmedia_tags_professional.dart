import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Column(
      children: [
        Container(height: 2,
          color: Colors.grey,
          margin: EdgeInsets.only(top:10,bottom: 10),),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 17),
              width: 10,
              child: IconButton(onPressed: widget.facebook_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
            Container(
              margin: EdgeInsets.only(right: 17),
              width: 10,
              child: IconButton(onPressed: widget.twitter_Onpressed(), icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
            Container(
              margin: EdgeInsets.only(right: 17),
              width: 10,
              child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
            Container(
              margin: EdgeInsets.only(right: 17),
              width: 10,
              child: IconButton(onPressed: widget.googlePlus_Onpressed(), icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
            Container(
              margin: EdgeInsets.only(right: 17),
              width: 10,
              child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
            // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
          ],),

        Container(height: 2,
          color: Colors.black,margin: EdgeInsets.only(bottom: 10),),
      ],
    );
  }
}
