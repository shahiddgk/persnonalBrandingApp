import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_buttons_row.dart';
import 'package:personal_branding/widgets/widget_comment_section.dart';
import 'package:personal_branding/widgets/widget_socialmedia_tags_professional.dart';

class PictureDetails extends StatefulWidget {
  const PictureDetails({Key? key}) : super(key: key);

  @override
  _PictureDetailsState createState() => _PictureDetailsState();
}

class _PictureDetailsState extends State<PictureDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Heading2("THIS IS A STANDARD POST WITH PREVIEW IMAGE"),

            //  ButtonsRow("HOME",(){},"BLOG",(){},"THIS IS A STANDARD POST",(){}),

              ButtonsRow("Admin",(){},"Web Design",(){},"Comments",(){}),

              Image.network("https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),

              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",textAlign: TextAlign.justify,style: TextStyle(color: Colors.black54),),

              SocialMediaTags((){},(){},(){},(){},(){}),

              CommentsSection("Kaleem", "Nov 23 2021", "https://cdn4.vectorstock.com/i/1000x1000/44/73/boy-avatar-in-round-web-button-isolated-on-white-vector-20694473.jpg",(){},"Lorem Ipsum is simply dummy text of the printing and typesetting industry."),


            ],
          ),
        ),
      ),
    );
  }
}
