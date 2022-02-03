import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FutureGoalsVedioList extends StatefulWidget {

  String urlImages ;

  FutureGoalsVedioList(this.urlImages);

  @override
  _FutureGoalsVedioListState createState() => _FutureGoalsVedioListState();
}

class _FutureGoalsVedioListState extends State<FutureGoalsVedioList> {

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    String? videoID = YoutubePlayer.convertUrlToId(widget.urlImages);
    return  Scaffold(
        appBar: AppBar(),
        body:Container(
            color: Colors.white,
            child:Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height*1 /
                20),
            child:Container(
          //alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
        //  height:  MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Heading1("Giving back to the community"),
              Text("Most organizations today concentrate on social responsibilities and related activities. They have a unique team working on those lines. It can be projected for a social cause, for the existing employees or any community. For instance, free education for the children of employees, housing amenities for economically backward sections, healthcare services for neglected ones, etc. Giving back to the community strengthens the company’s connection with the audience, and may not necessarily entail monetary benefits.",textAlign: TextAlign.justify,),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child:YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoID!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                liveUIColor: Colors.yellow,
                showVideoProgressIndicator: true,
              )),
            ],
          )
        ))));
  }

  // Widget buildImage(String urlImage, int index) => Container(
  //   color: Colors.grey,
  //   child: Container(
  //       alignment: Alignment.bottomLeft,
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(image: DecorationImage(
  //         image: NetworkImage(widget.urlImages[index].img),
  //       )
  //       ),
  //       child: Column(
  //         // children: [
  //         //   Image.asset("1.JPG"),
  //         // ],
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //       )),
  // );

}
