import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/chat_page.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/models/request/user_save_start_up_request.dart';
import 'package:personal_branding/models/request/widget_upload_file.dart';
import 'package:personal_branding/models/response/startup_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/providers/auth_provider.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_small_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/Headings/widget_text_partnership.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/TextFields/widget_title_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:personal_branding/widgets/widget_date_picker.dart';

import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register.dart';

// ignore: must_be_immutable
class Entrepreneur extends KFDrawerContent {

  @override
  _EntrepreneurState createState() => _EntrepreneurState();
}

class _EntrepreneurState extends State<Entrepreneur> {

  TextEditingController _titleFieldController = TextEditingController();
  TextEditingController _industryFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dateFieldController = TextEditingController();

  int _radioValue = 0;
  bool isVisible = false;
  bool isNewVisible = true;
  bool _isCheckingSession = true;
  bool _isLoading = true;
  bool _isLogInSession = true;
  late List<StartUpReadResponse> startUpReadResponse;
  String date = "";
  DateTime selectedDate = DateTime.now();
  String selectValue = "Investment";
  String FileName = ' ';
  late File? file;
  int indexx = -1;



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
    _checkedToken();
    _getStartUpList();

    //startTimer();

    Future.delayed(Duration(seconds: 1), () {
      // just delay for showing this slash page clearer because it too fast
      //checkSignedIn();
    });
  }

  _getStartUpList() {
       HTTPManager()
           .StartUp(_isCheckingSession==false && _isLogInSession == false ? " " : generalResponseModel.token, globalSessionUser.id)
           .then((value) {
         setState(() {
           _isLoading = false;
           print(value);
           startUpReadResponse = value;
         });
       }).catchError((e) {
         print(e);
         showAlert(context, e.toString(), true, () {
           setState(() {
             _isLoading = false;
           });
         }, () {
           _getStartUpList();
         });
       });
  }

  Future selectFile(int id) async {
     print(id);
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
      indexx = id;
      FileName = result.files.single.name;
    });
  }


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
        resizeToAvoidBottomInset: true,
      floatingActionButton: _isLoading==false && _isCheckingSession==false && _isLogInSession == false ? globalSessionUser == null || globalSessionUser.id != 0 ? FloatingActionButton(onPressed: () {
        _BottomSheet(context,globalSessionUser.id);
      },
        child: Icon(Icons.message),
      ) : null : null,
      body: _isLoading == false? SafeArea(
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/20,left: 20,right: 20,bottom:MediaQuery.of(context).size.height*1/70,),
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
                                  TextButton(onPressed: globalSessionUser.id != 0 ? (){

                                    showDialog(context: context, builder: (context) => AlertDialog(
                                      title: Text("Select A Plan"),
                                      content: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Radio<String>(value: "Partnership", groupValue: selectValue, onChanged: (Value){
                                              setState(() {
                                                print(Value);
                                              });
                                            }),
                                            Text("Partnership",style: TextStyle(fontSize: 12),),
                                            Radio<String>(value: "Investment", groupValue: selectValue, onChanged: (Value){
                                              setState(() {
                                               print(Value);
                                              });
                                            }),
                                            Text("Investment",style: TextStyle(fontSize: 12),),

                                          ],

                                        ),
                                      ),
                                    ));
                                    setState(() {
                                      isNewVisible = !isNewVisible;
                                    });

                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewProjectIdea()));
                                    } : (){}, child: Text("NEW IDEA",style: TextStyle(color: Colors.grey),))
                              ],),
                            ),
                            globalSessionUser == null || globalSessionUser.id != 0 ?
                           ListView.builder(
                           itemCount: startUpReadResponse.length,
                             physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemBuilder: (context,index) {
                             return Visibility(
                               visible: isNewVisible,
                               child: Container(
                                 margin: EdgeInsets.only(bottom: 10),
                                 child: Column(children: [
                                   GestureDetector(
                                     onTap: (){
                                       visibility(startUpReadResponse[index]);
                                     },
                                     child: ExpansionTile(
                                       collapsedTextColor: Colors.black,
                                       collapsedIconColor: Colors.white,
                                       iconColor: Colors.black,
                                       collapsedBackgroundColor: Colors.black,
                                       title: Text(startUpReadResponse[index].title,style: TextStyle(color: Colors.white),
                                       ),
                                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                       expandedAlignment: Alignment.centerLeft,
                                       children: [

                                         Container(
                                             margin: EdgeInsets.only(top: 10),
                                             child: Heading2WithDescription("Description", startUpReadResponse[index].message)),
                                         Heading2("Related Document"),
                                         Container(margin:EdgeInsets.only(top: 5),child: Text("add more documents")),
                                         Container(

                                           alignment: Alignment.centerLeft,
                                           decoration: BoxDecoration(
                                             border: Border.all(color: indexx == startUpReadResponse[index].id ? Colors.black :  Colors.white)
                                           ),
                                           child: Row(
                                             children: [
                                               SmallButton(title: 'Browse',onPressed: () async {

                                                 selectFile(startUpReadResponse[index].id);

                                               }, Width: 100,),

                                               Visibility(
                                                 visible: indexx == startUpReadResponse[index].id ? true : false,
                                                 child: Container(
                                                   child: Text("$FileName"),
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         Visibility(
                                           visible: indexx == startUpReadResponse[index].id ? true : false,
                                           child: SmallButton(title: "Submit", onPressed: (){

                                             // if(file==null)return;
                                             uploadFile(file,startUpReadResponse[index].id);

                                           }, Width: 90),
                                         ),


                                         Container(
                                           margin: EdgeInsets.only(top: 10),
                                           child: ListView.builder(
                                               physics: const NeverScrollableScrollPhysics(),
                                               shrinkWrap: true,
                                               itemCount: startUpReadResponse[index].partnerFiles.length,
                                               itemBuilder: (context,count){
                                                 return GestureDetector(
                                                   child: Container(
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
                                                                 Icon(Icons.remove_red_eye,size: 15,),
                                                                 Text("${startUpReadResponse[index].partnerFiles[count].fileInput}",style: TextStyle(fontSize: 10),)
                                                               ],),
                                                           ],
                                                         )
                                                     ),
                                                   ),
                                                 );
                                               }),
                                         )
                                       ],
                                     ),
                                     // Container(
                                     //   color: Colors.black,
                                     //   height: 40,
                                     //   width: MediaQuery.of(context).size.width,
                                     //   child: Row(
                                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     //     children: <Widget>[
                                     //       Container(margin:const EdgeInsets.only(left: 10),child: Text(startUpReadResponse[index].title,style: TextStyle(color: Colors.white),)),
                                     //       isVisible?Container(margin:const EdgeInsets.only(right: 10),child: Text("-",style: TextStyle(color: Colors.white),)):
                                     //       Container(margin:const EdgeInsets.only(right: 10),child:  Text("+",style: TextStyle(color: Colors.white),))
                                     //     ],
                                     //   ),
                                     // ),
                                   ),
                                   // Visibility(
                                   //   visible: isVisible,
                                   //   child: Container(
                                   //     child: Column(
                                   //       mainAxisAlignment: MainAxisAlignment.start,
                                   //       crossAxisAlignment: CrossAxisAlignment.start,
                                   //       children: <Widget>[
                                   //         Container(
                                   //             margin: EdgeInsets.only(top: 10),
                                   //             child: Heading2WithDescription("Description", startUpReadResponse[index].message)),
                                   //         Heading2("Related Document"),
                                   //         Container(margin:EdgeInsets.only(top: 5),child: Text("add more documents")),
                                   //         Row(
                                   //           children: [
                                   //             SmallButton(title: 'Browse',onPressed: () async {
                                   //
                                   //               selectFile();
                                   //
                                   //             }, Width: 100,),
                                   //
                                   //             Container(
                                   //               child: Text("$FileName"),
                                   //             )
                                   //           ],
                                   //         ),
                                   //         SmallButton(title: "Submit", onPressed: (){
                                   //
                                   //           // if(file==null)return;
                                   //           uploadFile(file,startUpReadResponse[index].id);
                                   //
                                   //           }, Width: 90),
                                   //
                                   //
                                   //         Container(
                                   //           margin: EdgeInsets.only(top: 10),
                                   //           child: ListView.builder(
                                   //               physics: const NeverScrollableScrollPhysics(),
                                   //               shrinkWrap: true,
                                   //               itemCount: startUpReadResponse[index].partnerFiles.length,
                                   //               itemBuilder: (context,count){
                                   //                 return Container(
                                   //                   margin: EdgeInsets.only(bottom: 10),
                                   //                   width: MediaQuery.of(context).size.width,
                                   //                   child: SingleChildScrollView(
                                   //                     scrollDirection: Axis.horizontal,
                                   //                     child: Column(
                                   //                       mainAxisSize: MainAxisSize.min,
                                   //                       children: [
                                   //                         Row(
                                   //                           mainAxisAlignment: MainAxisAlignment.start,
                                   //                           crossAxisAlignment: CrossAxisAlignment.start,
                                   //                           mainAxisSize: MainAxisSize.min,
                                   //                           children: [
                                   //                             Icon(Icons.remove_red_eye,size: 15,),
                                   //                             Text("${startUpReadResponse[index].partnerFiles[count].fileInput}",style: TextStyle(fontSize: 10),)
                                   //                           ],),
                                   //                       ],
                                   //                     )
                                   //                   ),
                                   //                 );
                                   //               }),
                                   //         )
                                   //       ],
                                   //     ),
                                   //   ),
                                   // ),
                                 ],),
                               ),
                             );
                             },
                           ) :
                              Visibility(
                                visible:globalSessionUser.id != 0 ? !isNewVisible : isNewVisible,
                                child: Column(children: [
                                  IndustryTitle(hint: "Title",controller: _titleFieldController,),

                                  Industry(hint: "Target Industry",controller: _industryFieldController,),

                                  MessageField(hint: "Description",controller: _messageFieldController,),

                                  DateField(hint: "Date Picker Here",controller: _dateFieldController, onTap: (){
                                    _selectDate(context);
                                  },),

                                  Button(title: "Browse", onPressed: (){}, Width: 90),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(value: 0, groupValue: _radioValue, onChanged: _handleRadioValueChange(0)),
                                      Text("Partnership",style: TextStyle(color: Colors.black87),),
                                      Radio(value: 1, groupValue: _radioValue, onChanged: _handleRadioValueChange(1)),
                                      Text("Investment Plan",style: TextStyle(color: Colors.black87),)

                                    ],),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Button(title: "REGISTER",Width: 110,onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));},),
                                      Button(title: "LOGIN",Width: 90,onPressed: () {

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));

                                      },),

                                    ],),
                                  PartnerShipText()
                                ],),
                              ),

                            Visibility(
                              visible:!isNewVisible,
                              child: Form(
                                key: _formKey,
                                child: Column(children: [
                                  IndustryTitle(hint: "Title",controller: _titleFieldController,),

                                  Industry(hint: "Target Industry",controller: _industryFieldController,),

                                  MessageField(hint: "Description",controller: _messageFieldController,),

                                  DateField(hint: "Date Picker Here",controller: _dateFieldController, onTap: (){
                                    _selectDate(context);
                                  },),

                                  Button(title: "Browse", onPressed: (){}, Width: 90),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(value: 0, groupValue: _radioValue, onChanged: _handleRadioValueChange(0)),
                                      Text("Partnership",style: TextStyle(color: Colors.black87),),
                                      Radio(value: 1, groupValue: _radioValue, onChanged: _handleRadioValueChange(1)),
                                      Text("Investment Plan",style: TextStyle(color: Colors.black87),)

                                    ],),
                                  
                                  Button(title: "SUBMIT", onPressed: (){
                                    newIdea();
                                  }, Width: 90),

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: <Widget>[
                                  //
                                  //     Button(title: "REGISTER",Width: 110,onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));},),
                                  //     Button(title: "LOGIN",Width: 90,onPressed: () {
                                  //
                                  //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
                                  //
                                  //     },),
                                  //
                                  //   ],),
                                  PartnerShipText()
                                ],),
                              ),
                            ),

                          ],
                        ),),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ) : Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }

  Future _checkedLogin() async {
   await getUserSession().then((value) => {
      if (value.id == null)
        {
          setState(() {
            _isLogInSession = false;
          })
        }
      else
        {
          setState(() {
            globalSessionUser = value;
            _isLogInSession = false;
          }),
        }
    });
  }

  Future _checkedToken() async {
    await getUserSessionToken().then((value) => {
      if (value.token == null)
        {
          setState(() {
            _isCheckingSession = false;
          })
        }
      else
        {
          setState(() {
            generalResponseModel = value;
            _isCheckingSession = false;
          }),
        }
    });
  }

  void visibility(StartUpReadResponse startUpReadResponse) {
    setState(() {
      isVisible = !isVisible;
      //isVisible==true ? _BottomSheet(context):null;
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;

        _dateFieldController.text = new DateFormat("yyyy-MM-dd").format(selectedDate);

        // _dateFieldController.text = "${selectedDate}";
      });
  }

   newIdea() {
     if (_formKey.currentState!.validate())
       {
         setState(() {
           _isLoading = true;
         });
         print(generalResponseModel.token,);
         print(_titleFieldController.text);
         print(_industryFieldController.text);
         print(_messageFieldController.text);
         print(_dateFieldController.text);
         print(selectValue);
         print(globalSessionUser.id);

         HTTPManager().savestartUpUser(generalResponseModel.token, SaveStartUpRequest(
             title: _titleFieldController.text,
             industry: _industryFieldController.text,
             message: _messageFieldController.text,
             date: _dateFieldController.text,
             purpose: selectValue,
             userid: "${globalSessionUser.id}")).then((value) {
               setState(() {
                 _isLoading = false;
                 isNewVisible = !isNewVisible;
               });
         }).catchError((e) {
           print(e);
           setState(() {
             _isLoading = false;
           });
           showAlert(context, e.toString(), true, () {}, () {
             newIdea();
           });
         });
       }
   }

   uploadFile(file, int partnershipid) {
    print("file::${file}");
    print("partnershipid::${partnershipid}");
     HTTPManager().uploadFile(
         generalResponseModel.token, UploadFile(
         project_id: "${partnershipid}", more_files: file
     )).then((value) {
       print(value);
     }).catchError((e) {
       print(e);
       setState(() {
         _isLoading = false;
       });
       showAlert(context, e.toString(), true, () {}, () {
         uploadFile(file, partnershipid);
       });
     });

   }

  // void openFile(PlatformFile file) {
  //    OpenFile.open(file.path!);
  // }
}
void _BottomSheet(BuildContext context, int id) {
  showModalBottomSheet(
    isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),  context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: MediaQuery.of(context).size.height*0.75,
            width: MediaQuery.of(context).size.width,
            child: ChatPage(peerNickname: ' '
                'Dr.Ahmed Hassan', peerAvatar: 'https://pixelz.cc/wp-content/uploads/2016/11/windows-10-uhd-4k-wallpaper.jpg', peerId: "$id",)
          ),
        );
      }
  );
}

class fileList {
  String imageName;
  File imageFile;

  fileList(this.imageName, this.imageFile);

}