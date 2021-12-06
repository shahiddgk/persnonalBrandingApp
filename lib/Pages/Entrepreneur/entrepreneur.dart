import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Biography/picture_detail.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/chat_page.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/home_page.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/splash_page.dart';
import 'package:personal_branding/Pages/Entrepreneur/project_Description_chat_screen.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/drawer.dart';
import 'package:personal_branding/providers/auth_provider.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/Headings/widget_text_partnership.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/TextFields/widget_title_field.dart';
import 'package:personal_branding/widgets/widget_project_idea.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register.dart';

// ignore: must_be_immutable
class Entrepreneur extends KFDrawerContent {

  @override
  _EntrepreneurState createState() => _EntrepreneurState();
}

class _EntrepreneurState extends State<Entrepreneur> {

  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();

  int _radioValue = 0;
  bool isVisible = false;
  bool _isCheckingSession = true;


   _handleRadioValueChange(int value) {

    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }


  @override
  void initState() {
    super.initState();

    _checkedLogin();

    Future.delayed(Duration(seconds: 1), () {
      // just delay for showing this slash page clearer because it too fast
      //checkSignedIn();
    });
  }

  // void checkSignedIn() async {
  //   AuthProvider authProvider = context.read<AuthProvider>();
  //   bool isLoggedIn = await authProvider.isLoggedIn();
  //   if (isLoggedIn) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ChatPage(peerId: 'ur7q0EfMa4ZwICPPyZbngj7QkfH3', peerAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa9UI1y4Shr253ibETjPCOWNBWWpKgQsVKaw&usqp=CAU', peerNickname: 'test',
  //     )));
  //     return;
  //   }
  //   // Navigator.pushReplacement(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => Entrepreneur()),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _BottomSheet(context,globalSessionUser.id);
      },
        child: Icon(Icons.message),
      ),
      body: SafeArea(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom:MediaQuery.of(context).size.height*1/70,),
                        child: Align(alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Heading1("LET'S CHANGE THE WORLD TOGETHER"),

                            Heading2WithDescription("DREAM,EXPLORE,DISCOVER","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("YOUR STRPS TO CHNAGE THE WORLD",style: TextStyle(fontSize: 10),),
                                  TextButton(onPressed: (){}, child: Text("NEW IDEA",style: TextStyle(color: Colors.grey),))
                              ],),
                            ),
                           //globalSessionUser == null ?
                           Column(children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isVisible = !isVisible;
                                    //isVisible==true ? _BottomSheet(context):null;
                                  });
                                },
                                child: Container(
                                  color: Colors.black,
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(margin:const EdgeInsets.only(left: 10),child: const Text("Provisional title idea",style: TextStyle(color: Colors.white),)),
                                      isVisible?Container(margin:const EdgeInsets.only(right: 10),child: const Text("-",style: TextStyle(color: Colors.white),)):
                                      Container(margin:const EdgeInsets.only(right: 10),child: const Text("+",style: TextStyle(color: Colors.white),))
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isVisible,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Heading2WithDescription("Description", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                                      Heading2("Related Document"),
                                      Text("add more documents"),
                                      Button(title: 'Browse',onPressed: (){}, Width: 100,),
                                      Container(
                                        child: Text("Document list here"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],)
                               //:
                            // Column(children: [
                            //   IndustryTitle(hint: "Title",controller: _nameFieldController,),
                            //
                            //   Industry(hint: "Target Industry",controller: _nameFieldController,),
                            //
                            //   MessageField(hint: "Description",controller: _messageFieldController,),
                            //
                            //   Industry(hint: "Date Picker Here",controller: _nameFieldController,),
                            //
                            //   Button(title: "Browse", onPressed: (){}, Width: 90),
                            //
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Radio(value: 0, groupValue: _radioValue, onChanged: _handleRadioValueChange(0)),
                            //       Text("Partnership",style: TextStyle(color: Colors.black87),),
                            //       Radio(value: 1, groupValue: _radioValue, onChanged: _handleRadioValueChange(1)),
                            //       Text("Investment Plan",style: TextStyle(color: Colors.black87),)
                            //
                            //     ],),
                            //
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: <Widget>[
                            //
                            //       Button(title: "REGISTER",Width: 110,onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));},),
                            //       Button(title: "LOGIN",Width: 90,onPressed: () {
                            //
                            //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
                            //
                            //       },),
                            //
                            //     ],),
                            //   PartnerShipText()
                            // ],)

                          ],
                        ),),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _checkedLogin() async {
   await getUserSession().then((value) => {
      if (value.id == null)
        {
          setState(() {
            _isCheckingSession = false;
          })
        }
      else
        {
          setState(() {
            globalSessionUser = value;
          }),
        }
    });
  }
}

void _BottomSheet(BuildContext context, int id) {
  showModalBottomSheet(
    isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),  context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          height: MediaQuery.of(context).size.height*0.85,
          width: MediaQuery.of(context).size.width,
          child: ChatPage(peerNickname: ' '
              'Dr.Ahmed Hassan', peerAvatar: 'https://pixelz.cc/wp-content/uploads/2016/11/windows-10-uhd-4k-wallpaper.jpg', peerId: "$id",)
        );
      }
  );
}