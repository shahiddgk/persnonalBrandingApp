import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:open_file/open_file.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/chat_page.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/home_page.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/constants/firestore_constants.dart';
import 'package:personal_branding/models/request/user_save_start_up_request.dart';
import 'package:personal_branding/models/request/widget_upload_file.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/models/response/startup_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/providers/auth_provider.dart';
import 'package:personal_branding/providers/home_provider.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Buttons/widget_buttons_row.dart';
import 'package:personal_branding/widgets/Buttons/widget_small_button.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/Headings/widget_text_partnership.dart';
import 'package:personal_branding/widgets/TextFields/widget_industry_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_title_field.dart';
import 'package:personal_branding/widgets/widget_date_picker.dart';
import 'package:personal_branding/widgets/widget_expansion_tile_detail.dart';
import 'package:personal_branding/widgets/widget_new_idea_form.dart';
import 'package:personal_branding/widgets/widget_radio_buttons.dart';
import 'package:personal_branding/widgets/widget_startup_list_tile.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../drawer.dart';
import '../home.dart';
import '../register.dart';

// ignore: must_be_immutable
class Entrepreneur extends KFDrawerContent {
  @override
  _EntrepreneurState createState() => _EntrepreneurState();
}

class _EntrepreneurState extends State<Entrepreneur> {
  final TextEditingController _titleFieldController = TextEditingController();
  TextEditingController _industryFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dateFieldController = TextEditingController();

  Timer? _timer;
  int _radioValue = 0;
  bool isVisible = false;
  bool isNewVisible = true;
  bool _isCheckingSession = true;
  bool _isLoading = true;
  bool _isLogInSession = true;
  List<StartUpReadResponse> startUpReadResponse = [];
  String date = "";
  DateTime selectedDate = DateTime.now();
  dynamic selectValue = "Partnership";
  String FileName = ' ';
  File? file;
  Uint8List? fileBytes;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //late List<File> files;
  int indexx = -1;
  dynamic selectValue1 = " ";
  late Map<int, dynamic> filesMap;
  late SessionUserModel sessionUserModel;

  late String currentUserId = "1";
 // late HomeProvider homeProvider;
  late Map<String, String> project_id;

  List<File> files = [];

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
    if (globalSessionUser.token != "") {
      _getStartUpList();
    } else {
      setState(() {
        _isLoading = false;
      });
    }

    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });

    // registerNotification();
    // configLocalNotification();

  }

  void registerNotification() {
    firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: $message');
      if (message.notification != null) {
        showNotification(message.notification!);
      }
      return;
    });

    firebaseMessaging.getToken().then((token) {
      print(globalSessionUser.id);
      print('push token: $token');
      if (token != null) {
        FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc(_isLoading == false && _isCheckingSession == false && globalSessionUser.id != 0 ? "${globalSessionUser.id}":'').update({'pushToken': token});
        //homeProvider.updateDataFirestore(FirestoreConstants.pathUserCollection, _isLoading == false && _isCheckingSession == false && globalSessionUser.id != 0 ? "${globalSessionUser.id}":'', {'pushToken': token});
      }
    }).catchError((err) {
      showAlert(context, err.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
      });
    });
  }

  void configLocalNotification() {
    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
    InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(RemoteNotification remoteNotification) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      Platform.isAndroid ? 'Branding' : 'com.ratedsolution.personalBranding',
      'Ahmed Hussein',
      'New Message received',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    print(remoteNotification);

    await flutterLocalNotificationsPlugin.show(
      0,
      remoteNotification.title,
      remoteNotification.body,
      platformChannelSpecifics,
      payload: null,
    );
  }

  Future _checkedLogin() async {
    await getUserSession().then((value) => {
      if (value.id == 0)
        {
          setState(() {
            _isCheckingSession = false;
            _isLoading = false;
          })
        }
      else
        {
          setState(() {
            _isCheckingSession = false;
            globalSessionUser = value;
            _isLoading = false;
          }),
        }
    });
  }

  _getStartUpList() {
    setState(() {
      _isLoading = true;
    });
    HTTPManager()
        .StartUp(globalSessionUser.token, globalSessionUser.id)
        .then((value) {
      setState(() {
        _isLoading = false;
        startUpReadResponse = value;
      });
    }).catchError((e) {
      print("e::$e");
      print(e.toString());
      if(e.toString() == "Error: Token is Expired")
      {
        logoutSessionUser();

        showAlert(context, e.toString(), true, () {
          setState(() {
            _isLoading = false;
          });
        }, () {
          Entrepreneur();
        });

      }
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
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        files = result.paths.map((path) => File(path!)).toList();
        indexx = id;
        print("Files::${files}");
        FileName = result.files.first.name;
      });
    }
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

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading == false
                && _isCheckingSession == false
                && globalSessionUser.id != 0 ?
            IconButton(onPressed: (){
              setState(() {
                _isLoading = true;
              });
              logoutSessionUser().then((value) => {
                setState(() {
                  globalSessionUser = value;
                  _isLoading = false;
                })
              });
            },icon: const Icon(Icons.logout),) :
            Row(
              children: <Widget>[
                Container(
                  height: 35,
                  child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));}, child: const Text("SIGN UP ",style: TextStyle(color: Colors.black),),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
                const Text(" | ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 5),
                  height: 35,
                  child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));}, child: const Text("SIGN IN ",style: TextStyle(color: Colors.black),),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
              ],)
          ],
          centerTitle: true,
          title: _isLoading == false &&
              _isCheckingSession == false &&
              globalSessionUser.id != 0 ? Text("Welcome ${globalSessionUser.name}") : null,
          leading: MenuWidget(),
        ),
        resizeToAvoidBottomInset: true,
        floatingActionButton: !_isLoading
            ? globalSessionUser.id != 0
                ? FloatingActionButton(
          onPressed: () {
            if (globalSessionUser.usertype == "admin") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {
              _BottomSheet(context, globalSessionUser.id);
            }
          },
          child: Icon(Icons.message),
        )
                : null
            : null,
        body: !_isLoading
            ? SafeArea(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      70,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Heading1(
                                          "LET'S CHANGE THE WORLD TOGETHER"),
                                      Heading2WithDescription(
                                          "DREAM,EXPLORE,DISCOVER",
                                          "Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails."),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const Text(
                                              "YOUR STEPS TO CHANGE THE WORLD",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            TextButton(
                                                onPressed:
                                                    globalSessionUser.id != 0
                                                        ? () {
                                                            isNewVisible == true
                                                                ? showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            AlertDialog(
                                                                              title: Text("Select A Plan"),
                                                                              content: Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                child:
                                                                                // RadioButtons(RadioValue: const ['Partnership', 'investment',], selectedValue: selectValue, radioButtonValue: (value) {
                                                                                //   selectValue = value;
                                                                                //   setState(() {});
                                                                                //   print(selectValue);
                                                                                // },),

                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    CustomRadioButton(
                                                                                      elevation: 0,
                                                                                      unSelectedColor: Theme.of(context).canvasColor,
                                                                                      buttonLables: const [
                                                                                        'Partnership',
                                                                                        'investment',
                                                                                      ],
                                                                                      enableShape: true,
                                                                                      buttonValues: const [
                                                                                        'Partnership',
                                                                                        'investment',
                                                                                      ],
                                                                                      buttonTextStyle: const ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.black, textStyle: TextStyle(fontSize: 12)),
                                                                                      radioButtonValue: (value) {
                                                                                        selectValue = value;
                                                                                        selectValue1 = selectValue;
                                                                                        setState(() {});
                                                                                        Navigator.of(context).pop();
                                                                                        print(selectValue);
                                                                                      },
                                                                                      defaultSelected: selectValue,
                                                                                      selectedColor: Theme.of(context).accentColor,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ))
                                                                : null;
                                                            setState(() {
                                                              isNewVisible =
                                                                  !isNewVisible;
                                                            });

                                                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewProjectIdea()));
                                                          }
                                                        : () {},
                                                child: const Text(
                                                  "NEW IDEA",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ))
                                          ],
                                        ),
                                      ),
                                      globalSessionUser.id != 0 &&
                                              !_isLoading &&
                                              startUpReadResponse != null
                                          ? ListView.builder(
                                              itemCount:
                                                  startUpReadResponse.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Visibility(
                                                  visible: isNewVisible,
                                                  child: Container(
                                                    margin: const EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            visibility(
                                                                startUpReadResponse[
                                                                    index]);
                                                          },
                                                          child: ExpansionTile(
                                                            collapsedTextColor:
                                                                Colors.white,
                                                            collapsedIconColor:
                                                                Colors.white,
                                                            iconColor:
                                                                Colors.black,
                                                            textColor:
                                                                Colors.black,
                                                            collapsedBackgroundColor:
                                                                Colors.black,
                                                            title: Text(
                                                              startUpReadResponse[
                                                                      index]
                                                                  .title,
                                                            ),
                                                            expandedCrossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            expandedAlignment:
                                                                Alignment
                                                                    .centerLeft,
                                                            children: [

                                                              ExpansionTileDetail(Description: startUpReadResponse[index].message,),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: indexx ==
                                                                                startUpReadResponse[index].id
                                                                            ? Colors.black
                                                                            : Colors.white)),
                                                                child: Row(
                                                                  children: [
                                                                    SmallButton(
                                                                      title:
                                                                          'Browse',
                                                                      onPressed:
                                                                          () async {
                                                                        selectFile(
                                                                            startUpReadResponse[index].id,);
                                                                      },
                                                                    ),
                                                                    Visibility(
                                                                      visible: indexx ==
                                                                              startUpReadResponse[index].id && FileName != ' '
                                                                          ? true
                                                                          : false,
                                                                      child:
                                                                          Container(
                                                                        child: Text(
                                                                            "$FileName"),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible: indexx ==
                                                                        startUpReadResponse[index]
                                                                            .id
                                                                    ? true
                                                                    : false,
                                                                child:
                                                                    SmallButton(
                                                                  title:
                                                                      "Submit",
                                                                  onPressed:
                                                                      () {
                                                                    if(files==null)return;
                                                                    uploadFile(
                                                                        files,
                                                                        startUpReadResponse[index]
                                                                            .id);
                                                                  },
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10),
                                                                child: ListView
                                                                    .builder(
                                                                        physics:
                                                                            const NeverScrollableScrollPhysics(),
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: startUpReadResponse[index]
                                                                            .partnerFiles
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                count) {
                                                                          return  StartUplistTileDetail(fileInput: startUpReadResponse[index].partnerFiles[count].fileInput, onTap: (){
                                                                            _launchURL(startUpReadResponse[index].partnerFiles[count].image);
                                                                          },);
                                                                        }),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : Column(
                                              children: [
                                                NewIdeaField(titleFieldController: _titleFieldController, industryFieldController: _industryFieldController, messageFieldController: _messageFieldController, dateFieldController: _dateFieldController, onTap: (){_selectDate(context);},),
                                                ButtonWithWidth(
                                                    title: "Browse",
                                                    onPressed: () {
                                                      print("browse clicked");
                                                    },
                                                    Width: 100),
                                                CustomRadioButton(
                                                  elevation: 0,
                                                  unSelectedColor:
                                                  Theme.of(context)
                                                      .canvasColor,
                                                  buttonLables: const [
                                                    'Partnership',
                                                    'investment',
                                                  ],
                                                  enableShape: true,
                                                  buttonValues: const [
                                                    'Partnership',
                                                    'investment',
                                                  ],
                                                  buttonTextStyle:
                                                  const ButtonTextStyle(
                                                      selectedColor:
                                                      Colors.white,
                                                      unSelectedColor:
                                                      Colors.black,
                                                      textStyle: TextStyle(
                                                          fontSize: 12)),
                                                  radioButtonValue: (value) {
                                                    selectValue = value;
                                                    setState(() {});
                                                    print(selectValue);
                                                  },
                                                  defaultSelected: selectValue,
                                                  selectedColor:
                                                  Theme.of(context)
                                                      .accentColor,
                                                ),

                                                ButtonsRow(RegisterClick: (){
                                                  // Navigator.of(context).push(
                                                  //     MaterialPageRoute(
                                                  //         builder:
                                                  //             (context) =>
                                                  //             Register()));
                                                }, LoginClick: (){
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                              LogIn()));
                                                },),
                                                PartnerShipText()
                                              ],
                                            ),
                                      if(globalSessionUser.id!=0)
                                      Visibility(
                                        visible: !isNewVisible,
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              NewIdeaField(titleFieldController: _titleFieldController, industryFieldController: _industryFieldController, messageFieldController: _messageFieldController, dateFieldController: _dateFieldController, onTap: (){_selectDate(context);},),
                                              // Button(
                                              //     title: "Browse",
                                              //     onPressed: () {
                                              //       print(
                                              //           "browse clicked line 589");
                                              //     },
                                              //     Width: 100),
                                              if (selectValue1 != ' ')

                                                // RadioButtons(RadioValue: const ['Partnership', 'investment',], selectedValue: selectValue1, radioButtonValue: (value) {
                                                //   selectValue = value;
                                                //   setState(() {});
                                                //   print(selectValue);
                                                // },),

                                                CustomRadioButton(
                                                  elevation: 0,
                                                  unSelectedColor:
                                                      Theme.of(context)
                                                          .canvasColor,
                                                  buttonLables: const [
                                                    'Partnership',
                                                    'investment',
                                                  ],
                                                  enableShape: true,
                                                  buttonValues: const [
                                                    'Partnership',
                                                    'investment',
                                                  ],
                                                  buttonTextStyle:
                                                      const ButtonTextStyle(
                                                          selectedColor:
                                                              Colors.white,
                                                          unSelectedColor:
                                                              Colors.black,
                                                          textStyle: TextStyle(
                                                              fontSize: 12)),
                                                  radioButtonValue: (value) {
                                                    selectValue = value;
                                                    setState(() {});
                                                    print(selectValue);
                                                  },
                                                  defaultSelected: selectValue1,
                                                  selectedColor:
                                                      Theme.of(context)
                                                          .accentColor,
                                                ),

                                              ButtonWithWidth(
                                                  title: "SUBMIT",
                                                  onPressed: () {
                                                    newIdeaSubmit();
                                                  },
                                                  Width: 100),
                                              PartnerShipText()
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )));
  }

  void visibility(StartUpReadResponse startUpReadResponse) {
    setState(() {
      isVisible = !isVisible;
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        _dateFieldController.text =
            new DateFormat("yyyy-MM-dd").format(selectedDate);
      });
    }
  }

  newIdeaSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      HTTPManager()
          .savestartUpUser(
              globalSessionUser.token,
              SaveStartUpRequest(
                  title: _titleFieldController.text,
                  industry: _industryFieldController.text,
                  message: _messageFieldController.text,
                  date: _dateFieldController.text,
                  purpose: selectValue,
                  userid: "${globalSessionUser.id}"))
          .then((value) {
        setState(() {
          _isLoading = false;
          isNewVisible = !isNewVisible;
        });
        _getStartUp();
      }).catchError((e) {
        print(e);
        setState(() {
          _isLoading = false;
        });
        showAlert(context, e.toString(), true, () {}, () {
          newIdeaSubmit();
        });
      });
    }
  }

  uploadFile(file, int partnershipid) {

    project_id = {'project_id':"$partnershipid"};
    print(project_id);

    HTTPManager()
        .uploadFile(globalSessionUser.token, project_id,files)
        .then((value) {
          setState(() {
            FileName == ' ';
          });
          _getStartUp();
      print(value);
    }).catchError((e) {
      print(e);
      setState(() {
        _isLoading = false;
        indexx == 0;
      });
      showAlert(context, e.toString(), true, () {}, () {
        uploadFile(file, partnershipid);
      });
    });
  }


  _getStartUp() {
    setState(() {
      _isLoading = false;
    });
    HTTPManager()
        .StartUp(globalSessionUser.token, globalSessionUser.id)
        .then((value) {
      setState(() {
        _isLoading = false;
        startUpReadResponse = value;
      });
    }).catchError((e) {
      print("e::$e");
      print(e.toString());
      showAlert(context, e.toString(), true, () {
        setState(() {
          _isLoading = false;
        });
      }, () {
        _getStartUpList();
      });
    });
  }

  _launchURL(String url) async {
     url = url; // you can use your url
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Unable to open url : $url';
    }
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}

void _BottomSheet(BuildContext context, int id) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: ChatPage(
                peerNickname: ' '
                    'Dr.Ahmed Hassan',
                peerAvatar:
                    'https://pixelz.cc/wp-content/uploads/2016/11/windows-10-uhd-4k-wallpaper.jpg',
                peerId: "$id",
              )),
        );
      });
}

class fileList {
  String imageName;
  File imageFile;

  fileList(this.imageName, this.imageFile);
}
