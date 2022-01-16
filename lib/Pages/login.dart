import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/Entrepreneur/pages/chat_page.dart';
import 'package:personal_branding/constants/constants.dart';
import 'package:personal_branding/drawer.dart';
import 'package:personal_branding/models/request/loin_request.dart';
import 'package:personal_branding/models/request/social_login_request.dart';
import 'package:personal_branding/models/response/general_response_model.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Buttons/widget_forgotpasswordbuttong.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_password_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';

// ignore: must_be_immutable
class LogIn extends KFDrawerContent {


  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SessionUserModel sessionUserModel;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){
        //   Navigator.of(context).pop();
        //   }, icon: const Icon(Icons.menu)
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start ,
                                children: <Widget>[
                                  Heading1("LOGIN"),
                                  EmailField(
                                    hint: "Enter email",
                                    controller: _emailFieldController,
                                  ),
                                  PasswordField(
                                    hint: "Enter password",
                                    controller: _passwordFieldController,
                                  ),
                                  ButtonWithWidth(title: "SignIn",Width: MediaQuery.of(context).size.width,onPressed: _loginUser,
                                  ),

                                ],
                              )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Divider(),
                              SignInButton(
                                Buttons.GoogleDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                onPressed: _registerUserWithGmail,
                              ),
                              Divider(),
                              SignInButton(
                                Buttons.Facebook,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                onPressed: _registerUserWithFacebook,
                              ),
                              Divider(),
                              ForgotPassword(title: "Forgot Password!",onPressed: () {},)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _registerUserWithGmail() async {

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;


      print("googleSignInAccount:::${googleSignInAccount}");
      print("googleSignInAccountAuthAccessToken:::${googleSignInAuthentication.accessToken}");
      print("googleSignInAccountAuthIdToken:::${googleSignInAuthentication.idToken}");
      print("googleSignInAccountAuthServerAuthCode:::${googleSignInAuthentication.serverAuthCode}");

      setState(() {
        _isLoading = true;
      });

      HTTPManager().registerUserWithSocialAccount(SocialLoginRequest(name: googleSignInAccount.displayName!,email: googleSignInAccount.email, id: googleSignInAccount.id, provider: "google")).then((value) {

        sessionUserModel = value;
        FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
            {
              FirestoreConstants.nickname: sessionUserModel.name,
              FirestoreConstants.photoUrl: '',
              FirestoreConstants.id: sessionUserModel.id,
              'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
              FirestoreConstants.chattingWith: null
            });
        saveUserSession(value);
        print(saveUserSession(value));
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainWidget(title: " ")));

      }).catchError((e) {
        print(e);
        setState(() {
          _isLoading =false;
        });
        showAlert(context, e.toString(), true, () {}, () {
          _registerUserWithGmail();
        });
      });
    }

  }

  _registerUserWithFacebook() async {

    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]).then((value) {
      FacebookAuth.instance.getUserData().then((value) {
        setState(() {
          _userObj = value;
          print("value:::${_userObj}");
          print("Name:::${_userObj["name"]}");
          print("email:::${_userObj["email"]}");
          print("id:::${_userObj["id"]}");

          HTTPManager().registerUserWithSocialAccount(SocialLoginRequest(name: _userObj["name"], email: _userObj["email"], id: _userObj["id"], provider: "facebook")).then((value) {

            sessionUserModel = value;
            FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
                {
                  FirestoreConstants.nickname: sessionUserModel.name,
                  FirestoreConstants.photoUrl: '',
                  FirestoreConstants.id: sessionUserModel.id,
                  'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
                  FirestoreConstants.chattingWith: null
                });
            saveUserSession(value);
            print(saveUserSession(value));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainWidget(title: " ")));

          }).catchError((e) {
            print(e);
            setState(() {
              _isLoading =false;
            });
            showAlert(context, e.toString(), true, () {}, () {
              _registerUserWithFacebook();
            });
          });


        });
      });
    });
  }

  _loginUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      HTTPManager()
          .loginUser(LoginRequest(
          email: _emailFieldController.text, password: _passwordFieldController.text))
          .then((value) {
        sessionUserModel = value;
        FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
            {
              FirestoreConstants.nickname: sessionUserModel.name,
              FirestoreConstants.photoUrl: '',
              FirestoreConstants.id: sessionUserModel.id,
              'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
              FirestoreConstants.chattingWith: null
            });
        saveUserSession(value);
        print(saveUserSession(value));
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainWidget(title: " ")));
      }).catchError((e) {
        print(e);
        setState(() {
          _isLoading = false;
        });
        showAlert(context, e.toString(), true, () {}, () {
          _loginUser();
        });
      });
    }
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainWidget(title: '')), (route) => false));
  }
}