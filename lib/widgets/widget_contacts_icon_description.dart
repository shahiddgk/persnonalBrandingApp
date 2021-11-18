import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactsIconDescription extends StatefulWidget {
  IconData icon;
  // ignore: non_constant_identifier_names
  String H2;
  // ignore: non_constant_identifier_names
  String H1;

  ContactsIconDescription(this.icon,this.H1,this.H2);


  @override
  _ContactsIconDescriptionState createState() => _ContactsIconDescriptionState();
}

class _ContactsIconDescriptionState extends State<ContactsIconDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(widget.icon,size: 25,color: Colors.amber,),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                      Text(widget.H2,),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.2,),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(widget.icon,size: 25,color: Colors.amber,),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                      Text(widget.H2,),
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
              Icon(widget.icon,size: 25,color: Colors.amber,),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.H1,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                    Text(widget.H2,),
                  ],
                ),
              ),

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

