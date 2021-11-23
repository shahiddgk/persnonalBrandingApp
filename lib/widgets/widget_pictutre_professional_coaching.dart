import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ProfessionalCoachingPictures extends StatefulWidget {

  String imageUrl;
  // ignore: non_constant_identifier_names
  String Date;
  // ignore: non_constant_identifier_names
  String Description;
  String title;
  // ignore: non_constant_identifier_names
  String B1title;
  // ignore: non_constant_identifier_names
  String B2title;
  // ignore: non_constant_identifier_names
  String B3title;
  // ignore: non_constant_identifier_names
  Function B1_Onpress;
  Function B2_Onpress;
  Function B3_Onpress;

  Function facebook_Onpressed;
  Function twitter_Onpressed;
  Function linkedIn_Onpressed;
  Function youtube_Onpressed;
  Function googlePlus_Onpressed;

  ProfessionalCoachingPictures(this.imageUrl,this.Date,this.title,this.B1title,this.B2title,this.B3title,this.Description,this.B1_Onpress,this.B2_Onpress,this.B3_Onpress,this.facebook_Onpressed,this.twitter_Onpressed,this.youtube_Onpressed,this.googlePlus_Onpressed,this.linkedIn_Onpressed);


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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Image.network(widget.imageUrl)),
              Text(widget.Date),
              Text(widget.title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 40,
                      width: 55,
                      child: TextButton(onPressed:widget.B1_Onpress(),child: Text(widget.B1title,style: const TextStyle(fontSize:12,color: Colors.black),))),
                  Container(
                      height: 40,
                      width: 80,
                      child: TextButton(onPressed: widget.B2_Onpress(),child: Text(widget.B2title,style: TextStyle(fontSize:12,color: Colors.black),))),
                  Container(
                      height: 40,
                      width: 75,
                      // ignore: prefer_const_constructors
                      child: TextButton(onPressed:widget.B3_Onpress(),child: Text(widget.B3title,style: TextStyle(fontSize:12,color: Colors.black),))),
                ],),
              Container(margin:EdgeInsets.only(top: 10,bottom: 10),height: 7,width: 90,color: Colors.yellow,),
              Text(widget.Description,style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 10,
                    child: IconButton(onPressed: widget.facebook_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 10,
                    child: IconButton(onPressed: widget.twitter_Onpressed(), icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 10,
                    child: IconButton(onPressed: widget.youtube_Onpressed(), icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
                  Container(
                    width: 10,
                    child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
                  // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                ],)
            ],),
        ),
      ),
    );
  }
}
