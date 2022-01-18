import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class ContactsIconDescription extends StatefulWidget {
  IconData icon1;
  // ignore: non_constant_identifier_names
  String icon1_H2;

  // ignore: non_constant_identifier_names
  String icon1_H3;
  // ignore: non_constant_identifier_names
  String icon1_H1;

  IconData icon2;
  // ignore: non_constant_identifier_names
  String icon2_H2;
  // ignore: non_constant_identifier_names
  String icon2_H1;

  IconData icon3;
  // ignore: non_constant_identifier_names
  String icon3_H2;
  // ignore: non_constant_identifier_names
  String icon3_H1;

  Function facebook_Onpressed;
  Function twitter_Onpressed;
  Function linkedIn_Onpressed;
  Function youtube_Onpressed;
  Function googlePlus_Onpressed;

  String Description_H1;
  String Description;

  ContactsIconDescription(this.icon1,this.icon1_H1,this.icon1_H2,this.icon1_H3,this.icon2,this.icon2_H1,this.icon2_H2,this.icon3,this.icon3_H1,this.icon3_H2, this.Description_H1,this.Description,this.facebook_Onpressed,this.twitter_Onpressed,this.youtube_Onpressed,this.googlePlus_Onpressed,this.linkedIn_Onpressed);


  @override
  _ContactsIconDescriptionState createState() => _ContactsIconDescriptionState();
}

class _ContactsIconDescriptionState extends State<ContactsIconDescription> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.grey,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.45,
                      margin: EdgeInsets.only(right: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right:2),
                                  child: Icon(widget.icon1,size: 28,color: Colors.amber,)),
                              Container(
                                margin: EdgeInsets.only(right: 2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(widget.icon1_H1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    Text(widget.icon1_H2,style: TextStyle(fontSize: 16),),
                                    Text(widget.icon1_H3,style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 2),
                                  child: Icon(widget.icon2,size: 28,color: Colors.amber,)),
                              Container(
                                margin: EdgeInsets.only(right: 2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(widget.icon2_H1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    Text(widget.icon2_H2,style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 2),
                                child: Icon(widget.icon3,size: 28,color: Colors.amber,)),
                            Container(
                              margin: EdgeInsets.only(right: 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.icon3_H1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text(widget.icon3_H2,style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            child: Text(widget.Description_H1,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))),
                        Text(widget.Description,style: TextStyle(fontSize:14,fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
                        Container(
                          width: MediaQuery.of(context).size.width/2.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // margin: EdgeInsets.only(right: 17),
                                          // width: 10,
                                          child: IconButton(onPressed: () {
                                            widget.facebook_Onpressed();
                                          }, icon: Icon(Icons.facebook,size: 20,)),),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // margin: EdgeInsets.only(right: 17),
                                          // width: 10,
                                          child: IconButton(onPressed: () {
                                            widget.twitter_Onpressed();
                                          }, icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // margin: EdgeInsets.only(right: 17),
                                          // width: 10,
                                          child: IconButton(onPressed: () {
                                            widget.youtube_Onpressed();
                                          }, icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // margin: EdgeInsets.only(right: 17),
                                          // width: 10,
                                          child: IconButton(onPressed:() {
                                            widget.googlePlus_Onpressed();
                                          }, icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          // margin: EdgeInsets.only(right: 17),
                                          // width: 10,
                                          child: IconButton(onPressed: () {
                                            widget.linkedIn_Onpressed();
                                          }, icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
                                      ),
                                     // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                                    ],),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.grey,),
            ],
          ),
    ) : Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Container(
                width: MediaQuery.of(context).size.width/2.45,
                margin: EdgeInsets.only(right: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right:2),
                              child: Icon(widget.icon1,size: 15,color: Colors.amber,)),
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget.icon1_H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                                Text(widget.icon1_H2,style: TextStyle(fontSize: 10,),textAlign: TextAlign.start,),
                                Text(widget.icon1_H3,style: TextStyle(fontSize: 10,),textAlign: TextAlign.start,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 2),
                              child: Icon(widget.icon2,size: 15,color: Colors.amber,)),
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget.icon2_H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                Text(widget.icon2_H2,style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 2),
                            child: Icon(widget.icon3,size: 15,color: Colors.amber,)),
                        Container(
                          margin: EdgeInsets.only(right: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.icon3_H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(widget.icon3_H2,style: TextStyle(fontSize: 10,),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text(widget.Description_H1,style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.start,)),
                  Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.Description,style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 17),
                                width: 10,
                                child: IconButton(onPressed: () {
                                  widget.facebook_Onpressed();
                                }, icon: Icon(Icons.facebook,size: 20,)),),
                              Container(
                                margin: EdgeInsets.only(right: 17),
                                width: 10,
                                child: IconButton(onPressed:() {
                                  widget.twitter_Onpressed();
                                }, icon: FaIcon(FontAwesomeIcons.twitter,size: 20,)),),
                              Container(
                                margin: EdgeInsets.only(right: 17),
                                width: 10,
                                child: IconButton(onPressed: () {
                                            widget.youtube_Onpressed();
                                          }, icon: FaIcon(FontAwesomeIcons.youtube,size: 20,)),),
                              Container(
                                margin: EdgeInsets.only(right: 17),
                                width: 10,
                                child: IconButton(onPressed: (){widget.googlePlus_Onpressed();}, icon: FaIcon(FontAwesomeIcons.googlePlus,size: 20,)),),
                              Container(
                                margin: EdgeInsets.only(right: 17),
                                width: 10,
                                child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: FaIcon(FontAwesomeIcons.linkedin,size: 20,)),),
                              // Container(child: IconButton(onPressed: widget.linkedIn_Onpressed(), icon: Icon(Icons.facebook,size: 20,)),),
                            ],)
                        ],
                      ))
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ContactsDescription extends StatefulWidget {
  String description;
   ContactsDescription(this.description);

  @override
  _ContactsDescriptionState createState() => _ContactsDescriptionState();
}

class _ContactsDescriptionState extends State<ContactsDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.description),
    );
  }
}

