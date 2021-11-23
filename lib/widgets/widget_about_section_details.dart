import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutSectionDetails extends StatefulWidget {
  String Name;
  String Email;
  String Phone;
  String DateOfBirth;
  String Address;
  String Natinality;

  AboutSectionDetails(this.Name,this.Email,this.Phone,this.DateOfBirth,this.Address,this.Natinality);

  @override
  _AboutSectionDetailsState createState() => _AboutSectionDetailsState();
}

class _AboutSectionDetailsState extends State<AboutSectionDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(margin:EdgeInsets.only(bottom: 2),child: Text("• Name: ${widget.Name}",style: TextStyle(color: Colors.black54,fontSize: 17),)),
          Container(margin:EdgeInsets.only(bottom: 2),child: Text("• Email: ${widget.Email}",style: TextStyle(color: Colors.black54,fontSize: 17),)),
          Container(margin:EdgeInsets.only(bottom: 2),child: Text("• Phone: ${widget.Phone}",style: TextStyle(color: Colors.black54,fontSize: 17),)),
          Container(margin:EdgeInsets.only(bottom: 2),child: Text("• Date of birth: ${widget.DateOfBirth}",style: TextStyle(color: Colors.black54,fontSize: 17),)),
          Container(margin:EdgeInsets.only(bottom: 2),child: Text("• Address: ${widget.Address}",style: TextStyle(color: Colors.black54,fontSize: 17),)),
          Container(margin:EdgeInsets.only(bottom: 2),child: Text("• Nationality: ${widget.Natinality}",style: TextStyle(color: Colors.black54,fontSize: 17),)),
        ],
      ),
    );
  }
}
