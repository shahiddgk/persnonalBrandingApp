import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'Headings/widget_heading2withdescription.dart';

class NewIdea extends StatefulWidget {
bool isVisible;
String Project_Name;
String Description_Headign;
String Description;
String H2;
Function BrowseButtonOnPressed;

NewIdea(this.isVisible,this.Project_Name,this.Description_Headign,this.Description,this.H2,this.BrowseButtonOnPressed);


  @override
  _NewIdeaState createState() => _NewIdeaState();
}

class _NewIdeaState extends State<NewIdea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
            color: Colors.black,
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(margin:const EdgeInsets.only(left: 10),child: Text(widget.Project_Name,style: TextStyle(color: Colors.white),)),
                widget.isVisible?Container(margin:const EdgeInsets.only(right: 10),child: const Text("-",style: TextStyle(color: Colors.white),)):
                Container(margin:const EdgeInsets.only(right: 10),child: const Text("+",style: TextStyle(color: Colors.white),))
              ],
            ),
        ),
        Visibility(
          visible: widget.isVisible,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

    ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(margin:EdgeInsets.only(bottom: 1),child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Text(widget.Description_Headign,style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal)),
    Container(margin:EdgeInsets.only(top: 25),child: Text(widget.Description,style: TextStyle(color: Colors.black87,fontSize: 18),textAlign: TextAlign.justify,)),
    ],
    )) :  Container(margin:EdgeInsets.only(bottom: 15),child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Text(widget.Description_Headign,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal)),
    Container(margin:EdgeInsets.only(top: 25),child: Text(widget.Description,style: TextStyle(color: Colors.black87),textAlign: TextAlign.justify,)),
    ],
    )),

                ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Text(widget.H2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal)) : Text(widget.H2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)),
                Text("add more documents"),
                Button(title: 'Browse',onPressed: (){
                  widget.BrowseButtonOnPressed();
                }, Width: 100,),
                Container(
                  child: Text("Document list here"),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
