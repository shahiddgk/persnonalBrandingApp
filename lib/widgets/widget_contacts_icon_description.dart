import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactsIconDescription extends StatefulWidget {
  IconData icon1;
  // ignore: non_constant_identifier_names
  String icon1_H2;
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

  String Description_H1;
  String Description;

  ContactsIconDescription(this.icon1,this.icon1_H1,this.icon1_H2,this.icon2,this.icon2_H1,this.icon2_H2,this.icon3,this.icon3_H1,this.icon3_H2, this.Description_H1,this.Description);


  @override
  _ContactsIconDescriptionState createState() => _ContactsIconDescriptionState();
}

class _ContactsIconDescriptionState extends State<ContactsIconDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Container(
                    margin: EdgeInsets.only(right: 10),
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
                            Icon(widget.icon1,size: 25,color: Colors.amber,),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.icon1_H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                  Text(widget.icon1_H2,),
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
                            Icon(widget.icon2,size: 25,color: Colors.amber,),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.icon2_H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                  Text(widget.icon2_H2,),
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
                          Icon(widget.icon3,size: 25,color: Colors.amber,),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget.icon3_H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                Text(widget.icon3_H2,),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.Description_H1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
                      Text(widget.Description,style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal))
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

