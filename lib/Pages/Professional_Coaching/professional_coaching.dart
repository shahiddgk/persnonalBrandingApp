
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/widget_pictutre_professional_coaching.dart';

// ignore: must_be_immutable
class ProfessionalCoaching extends KFDrawerContent {


  @override
  _ProfessionalCoachingState createState() => _ProfessionalCoachingState();
}

class _ProfessionalCoachingState extends State<ProfessionalCoaching> {
  
  // ignore: non_constant_identifier_names
  List profile_coaching = [
    ProfessionalCoachingPictures("https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg", "Saturday", "Picture Name", "Admin", "WebDesign", "Comments", "Description", (){}, (){}, (){}),
    ProfessionalCoachingPictures("https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg", "Saturday", "Picture Name", "Admin", "WebDesign", "Comments", "Description", (){}, (){}, (){}),
    ProfessionalCoachingPictures("https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg", "Saturday", "Picture Name", "Admin", "WebDesign", "Comments", "Description", (){}, (){}, (){})
                          ];     
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/40,left: 20,right: 20),
                      child: Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("Professional Coaching"),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: profile_coaching.length,
                                  gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisExtent: MediaQuery.of(context).size.height,
                                  mainAxisSpacing: 5),
                                  itemBuilder:(context, index) {
                                  return profile_coaching[index];
                                  } ),
                            ),
                          ],
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


