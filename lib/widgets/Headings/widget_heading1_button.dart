import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/Pages/Entrepreneur/entrepreneur.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:marquee_text/marquee_text.dart';

// ignore: must_be_immutable
class Heading1WithButton extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String H1;

  Heading1WithButton(this.H1);

  @override
  _Heading1WithButtonState createState() => _Heading1WithButtonState();
}

class _Heading1WithButtonState extends State<Heading1WithButton> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          // Container(
          //     margin: EdgeInsets.only(right: 130),
          //     child: const MarqueeText(
          //       text: TextSpan(
          //         text: 'There is no responsibility without authority.',
          //       ),
          //       style: TextStyle(
          //         fontSize: 24,
          //         color: Colors.amber,
          //       ),
          //       speed: 30,
          //     )),

          Text(widget.H1,style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold)
          ),
          Container(
            decoration: BoxDecoration(
              //color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
              //   border: Border.all(
              // //color: Colors.white,
              //     width: 3,)
            ),
            child: ElevatedButton(
              onPressed:() {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Entrepreneur()));}, //since this is only a UI app
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: const Text("TURN IDEA INTO BUISNESS",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.normal,
                ),
              ),

            ),
          ),
         // Button(title: "LET's START SOMETHING BIG", onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Entrepreneur()));},),
          Container(margin:EdgeInsets.only(top: 25,bottom: 25),height: 7,width: 100,color: Colors.amber,),
        ],
      ),
    ) : Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

         // Container(
         //     margin: EdgeInsets.only(right: 130),
         //     child: const MarqueeText(
         //    text: TextSpan(
         //      text: 'Success is where preparation and opportunity meet.',
         //    ),
         //    style: TextStyle(
         //      fontSize: 24,
         //      color: Colors.amber,
         //    ),
         //    speed: 30,
         //  )),

          Text(widget.H1,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed:() {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Entrepreneur()));}, //since this is only a UI app
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: const Text("TURN IDEA INTO BUISNESS",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.normal,
                ),
              ),

            ),
          ),
          //Button(title: "LET's START SOMETHING BIG", onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Entrepreneur()));},),
          Container(margin:EdgeInsets.only(top: 25,bottom: 25),height: 7,width: 90,color: Colors.amber,),
        ],
      ),
    );
  }
}
