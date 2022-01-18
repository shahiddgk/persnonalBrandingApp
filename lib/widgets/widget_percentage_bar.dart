import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentageBar extends StatefulWidget {

  double Percentage;
  String HeadingName;
  String Description;

  PercentageBar({required this.Percentage,required this.HeadingName,required this.Description});

  @override
  _PercentageBarState createState() => _PercentageBarState();
}

class _PercentageBarState extends State<PercentageBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child:Row(
          children: [
            Expanded(
                flex: 1,
                child:Container(
                margin:EdgeInsets.only(right: 15),
                child:CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 5.0,
                  animation: true,
                  percent: widget.Percentage/100,
                  center: Text(
                    widget.Percentage.toString() + "%",
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber),
                  ),
                  backgroundColor: Colors.black12,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.grey,
                ))),
            Expanded(
                flex: 1,
                child:Container(child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.HeadingName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                Text(widget.Description,textAlign: TextAlign.justify,)
              ],
            )))
          ],
        ));
  }
}
