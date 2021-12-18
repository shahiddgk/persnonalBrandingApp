import 'dart:io';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/chat_page.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/home_page.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/models/request/user_save_start_up_request.dart';
import 'package:personal_branding/models/request/widget_upload_file.dart';
import 'package:personal_branding/models/response/startup_response_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/providers/auth_provider.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
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
  List<StartUpReadResponse> startUpReadResponse = [];
  String date = "";
  DateTime selectedDate = DateTime.now();
  dynamic selectValue = "Partnership";
  String FileName = ' ';
  File? file;

  //late List<File> files;
  int indexx = -1;
  dynamic selectValue1 = " ";
  late Map<int, dynamic> filesMap;

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
    if (globalSessionUser.token != "") {
      _getStartUpList();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
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

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: widget.onMenuPressed,
            icon: Icon(Icons.menu),
          ),
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
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
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
                                                                              startUpReadResponse[index].id
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
                                                                    if(file==null)return;
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
                                                                          return  StartUplistTileDetail(fileInput: startUpReadResponse[index].partnerFiles[count].fileInput, onTap: (){},);
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
                                                Button(
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
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                              Register()));
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
                                      Visibility(
                                        visible: !isNewVisible,
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              NewIdeaField(titleFieldController: _titleFieldController, industryFieldController: _industryFieldController, messageFieldController: _messageFieldController, dateFieldController: _dateFieldController, onTap: (){_selectDate(context);},),
                                              Button(
                                                  title: "Browse",
                                                  onPressed: () {
                                                    print(
                                                        "browse clicked line 589");
                                                  },
                                                  Width: 100),
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

                                              Button(
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
              ));
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
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;

        _dateFieldController.text =
            new DateFormat("yyyy-MM-dd").format(selectedDate);
      });
  }

  _selectFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'pdf', 'doc']);

    if (result != null) {
      setState(() {
        files = result.paths.map((path) => File(path!)).toList();
      });
    } else {
      // User canceled the picker
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
    print("file::${files}");
    print("partnershipid::${partnershipid}");
    HTTPManager()
        .uploadFile(globalSessionUser.token,
            UploadFile(project_id: "${partnershipid}", more_files: file))
        .then((value) {
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
