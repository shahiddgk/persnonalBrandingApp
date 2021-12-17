import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Biography/picture_detail.dart';
import 'package:personal_branding/models/response/biography_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2_description_picure.dart';

// ignore: must_be_immutable
class Biography extends KFDrawerContent {
  @override
  _BiographyState createState() => _BiographyState();
}

class _BiographyState extends State<Biography>
    with SingleTickerProviderStateMixin {
  // List images = [
  //   Heading2WithDescriptionWiithImage("BUSINESS MASTERY", "We don’t live in the same world that we lived in at the beginning of this year… and if your business isn’t keeping up with this rapidly changing world, you risk being left behind.In this time of upheaval – during this economic winter – you can either get caught in the storm and suffer, or you can use this time to innovate, create and master your skill set to launch into a thriving and successful future.", "https://branding.ratedsolution.com/public/biography/1638002019_business-mastery.png",(){}),];
  String api_response = "";
  bool _isLoading = true;

  late List<BiographyReadResponse> biographyReadResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getBiographyList();
  }

  _getBiographyList() {
    HTTPManager().Biography().then((value) {
      setState(() {
        _isLoading = false;
        print(value);
        biographyReadResponse = value;
      });
    }).catchError((e) {
      print(e);
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getBiographyList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
        //   bottom: TabBar(
        //     isScrollable: true,
        //     controller: controller,
        //     tabs: const [
        //       Tab(text: "BIOGRAPHY",),
        //       Tab(text: "ACHIEVEMENT",),
        //       Tab(text: "FUTURE\n GOALS",),
        //     ],),
        // ),
        body: _isLoading == false
            ? SafeArea(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // Row(
                      //   children: <Widget>[
                      //     ClipRRect(
                      //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      //       child: Material(
                      //         shadowColor: Colors.transparent,
                      //         color: Colors.transparent,
                      //         child: IconButton(
                      //           icon: Icon(
                      //             Icons.menu,
                      //             color: Colors.black,
                      //           ),
                      //           onPressed: widget.onMenuPressed,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        1 /
                                        20,
                                    left: 20,
                                    right: 20,
                                    bottom: MediaQuery.of(context).size.height *
                                        1 /
                                        70),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Heading1("BIOGRAPHY"),

                                        // Heading2WithDescription(biographyReadResponse.title,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                                    ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                biographyReadResponse.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  // Navigator.of(context).push(
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             PictureDetails()));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Heading2WithDescriptionWiithImage(
                                                      biographyReadResponse[index]
                                                          .title,
                                                      biographyReadResponse[index]
                                                          .body,
                                                      biographyReadResponse[index]
                                                                  .images
                                                                  .length >
                                                              0
                                                          ? biographyReadResponse[
                                                                  index]
                                                              .images[0]
                                                              .img
                                                          : "",
                                                      () {}),
                                                ),
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
