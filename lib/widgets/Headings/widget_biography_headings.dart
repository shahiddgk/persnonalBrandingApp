// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class BiographyHeadings extends StatefulWidget {

  String BiographyHeading;

  BiographyHeadings({required this.BiographyHeading});

  @override
  _BiographyHeadingsState createState() => _BiographyHeadingsState();
}

class _BiographyHeadingsState extends State<BiographyHeadings> {
  @override
  Widget build(BuildContext context) {
    return  ResponsiveWrapper.of(context).isTablet || ResponsiveWrapper.of(context).isDesktop ? Container(
        margin: const EdgeInsets.only(top: 10,bottom: 5),
        child:Text(widget.BiographyHeading,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))) : Container(
        margin: const EdgeInsets.only(top: 10,bottom: 5),
        child:Text(widget.BiographyHeading,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold)));
  }
}
