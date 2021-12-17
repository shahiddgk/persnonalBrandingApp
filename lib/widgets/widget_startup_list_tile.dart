import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartUplistTileDetail extends StatefulWidget {

  String fileInput;
  Function onTap;

  StartUplistTileDetail({required this.fileInput,required this.onTap});

  @override
  _StartUplistTileDetailState createState() => _StartUplistTileDetailState();
}

class _StartUplistTileDetailState extends State<StartUplistTileDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){widget.onTap();},
      child:
      Container(
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      size: 15,
                    ),
                    Text(
                      widget.fileInput,
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            )),
      ),
    );;
  }
}
