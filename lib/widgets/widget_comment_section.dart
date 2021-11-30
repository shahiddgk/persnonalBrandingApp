import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Buttons/widget_button.dart';
import 'Headings/widget_heading2.dart';

class CommentsSection extends StatefulWidget {

  String Name;
  String Date;
  String Imageurl;

  Function Reply_Button_OnPressed;
  String Message;

  CommentsSection(this.Name,this.Date,this.Imageurl,this.Reply_Button_OnPressed,this.Message);

  @override
  _CommentsSectionState createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(width: MediaQuery.of(context).size.width/10,child: CircleAvatar(
                            child: Image.network(widget.Imageurl),
                            backgroundColor: Colors.transparent,),),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(widget.Name,style: TextStyle(fontSize: 18,color: Colors.black),textAlign: TextAlign.justify,),
                              Text(widget.Date,style: TextStyle(fontSize:14,color: Colors.black),textAlign: TextAlign.justify)
                            ],)
                        ],),

                      Align(alignment:Alignment.bottomCenter,child: Button(onPressed: (){widget.Reply_Button_OnPressed();}, title: "Reply", Width: 85,)),

                    ],),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: MediaQuery.of(context).size.width/1.7,
                    child: Text(widget.Message,style:TextStyle(fontSize: 17),textAlign: TextAlign.justify,)),
              ),
            ],
          ),
          Container(height: 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            margin: EdgeInsets.only(top:10,bottom: 10),),
        ],
      ),
    ) : Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(width: MediaQuery.of(context).size.width/10,child: CircleAvatar(
                          child: Image.network(widget.Imageurl),
                          backgroundColor: Colors.transparent,),),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(widget.Name,style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.justify,),
                            Text(widget.Date,style: TextStyle(fontSize: 8,color: Colors.black),textAlign: TextAlign.justify)
                          ],)
                      ],),

                    Button(onPressed: (){widget.Reply_Button_OnPressed();}, title: "Reply", Width: 85,),

                    Container(height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.only(top:10,bottom: 10),),


                  ],),
              ),
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width/1.7,
              child: Text(widget.Message,textAlign: TextAlign.justify,))
        ],
      )
    );
  }
}
