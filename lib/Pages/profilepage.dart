
import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_branding/models/request/update_profile.dart';
import 'package:personal_branding/models/request/user_data_requesst.dart';
import 'package:personal_branding/models/response/user_data.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String countryName = "Pakistan";
  final TextEditingController _cityFieldController = TextEditingController();
  final TextEditingController _industryFieldController = TextEditingController();
  final TextEditingController _companyFieldController = TextEditingController();
  final TextEditingController _designationFieldController = TextEditingController();
  final TextEditingController _currentStatusFieldController = TextEditingController();
  final TextEditingController _mobileFieldController = TextEditingController();
  final TextEditingController _landlineFieldController = TextEditingController();

  File? _image;
  String imageUrl = "";

  List<File> files = [];
  late UserProfileData userProfileData;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final PickedFile? pickedImage =
    await _picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageUrl = "";
        _image = File(pickedImage.path);
        files.add(_image!);
      });
    }
  }

  bool _isCheckingSession = true;
  bool _isLoading = true;

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
            //_isCheckingSession = false;
            globalSessionUser = value;
            //_isLoading = false;
            _getProfileData();
          }),
        }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkedLogin();
    if(_isLoading = false) {

      _landlineFieldController.text = userProfileData.landline.toString();
      _mobileFieldController.text = userProfileData.mobile.toString();
      _currentStatusFieldController.text = userProfileData.current_status;
      _designationFieldController.text = userProfileData.designation;
      _companyFieldController.text = userProfileData.company;
      _industryFieldController.text = userProfileData.industry;
      _cityFieldController.text = userProfileData.city;
      countryName = userProfileData.country;
      imageUrl = userProfileData.profile_image;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _isLoading == false ? Column(
            children: <Widget>[
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*1/20,left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Heading1("MY PROFILE"),

                               Align(
                                 alignment: Alignment.topCenter,
                                 child:GestureDetector(
                                     onTap: _openImagePicker,
                                     child:
                                     imageUrl == "" && _image != null ?
                                     CircleAvatar(
                                       backgroundColor: Colors.grey,
                                       radius: 100,
                                       child: CircleAvatar(
                                         radius: 100 - 5,
                                         backgroundImage: Image.file(
                                           _image!,
                                           fit: BoxFit.cover,
                                         ).image,
                                       ),
                                     ) : CircleAvatar(
                                       backgroundColor: Colors.grey,
                                       radius: 100,
                                       child: CircleAvatar(
                                         radius: 100 - 2,
                                         backgroundImage: Image.network(
                                           imageUrl,
                                           fit: BoxFit.cover,
                                         ).image,
                                       ),
                                     ),
                                 ),),
                              Divider(),
                              Container(
                                child: Padding(padding: EdgeInsets.only(left: 0.0,right: 0.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(border: Border.all()),
                                  child: CountryListPick(
                                    initialSelection: '+92',
                                    theme: CountryTheme(
                                      isShowFlag: true,
                                      isShowCode: false,
                                      showEnglishName: true,
                                    ),
                                      useSafeArea: false,
                                    onChanged: (code) async {
                                      setState(() {
                                        countryName = code!.name!;
                                      });
                                      print(code!.name);
                                      print(code.code);
                                      print(code.dialCode);
                                      print(code.flagUri);
                                    },
                                  ),
                                ),),
                              ),
                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    controller: _cityFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Enter City",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    controller: _industryFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Enter Industry",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    controller: _companyFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Company/Business",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    controller: _designationFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Enter Designation",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    controller: _currentStatusFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Enter Current Status",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: _mobileFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Enter Active Mobile",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: _landlineFieldController,
                                    decoration: const InputDecoration(
                                        focusColor: Colors.black,
                                        border: OutlineInputBorder(),
                                        hintText: "Enter Landline",
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),

                                  ),
                                ),
                            //    Button(title: "Select Image", onPressed: _openImagePicker),

                                ButtonWithWidth(title: "SUBMIT QUERY",Width: MediaQuery.of(context).size.width,onPressed:_updateProfile,
                                ),

                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ) : const Center(child: CircularProgressIndicator(),)
        ),
      ),
    );
  }

_getProfileData() async {
    print(globalSessionUser.id);
    setState(() {
      _isCheckingSession = true;
      _isLoading = true;
    });
  HTTPManager().getUserData(UserDataRequest(user_id: globalSessionUser.id.toString())).then((value) {
    print(value.profile_image);

    setState(() {
      _isCheckingSession = false;
      _isLoading = false;
    });

    userProfileData = value;

    _landlineFieldController.text = value.landline.toString();
    _mobileFieldController.text = value.mobile.toString();
    _currentStatusFieldController.text = value.current_status;
    _designationFieldController.text = value.designation;
    _companyFieldController.text = value.company;
    _industryFieldController.text = value.industry;
    _cityFieldController.text = value.city;
    countryName = value.country;
    imageUrl = value.profile_image;

  });
}

  _updateProfile() async {
    if (_formKey.currentState!.validate()) {

      dynamic profile_map =
        {
          'country': countryName,
          'city': _cityFieldController.text,
          'industry': _industryFieldController.text,
          'company': _companyFieldController.text,
          'designation': _designationFieldController.text,
          'current_status': _currentStatusFieldController.text,
          'mobile': _mobileFieldController.text,
          'landline': _landlineFieldController.text,
          'user_id': globalSessionUser.id.toString(),
        };
      print(profile_map);

      HTTPManager()
          .updateProfile(profile_map,files)
          .then((value) {
        EasyLoading.showSuccess("Successful");
        EasyLoading.dismiss(animation: true);
        print(value);
      }).catchError((e) {
        print(e);
        setState(() {
          _isLoading = false;

        });
        showAlert(context, e.toString(), true, () {}, () {
          _updateProfile();
        });
      });

    }
  }
}
