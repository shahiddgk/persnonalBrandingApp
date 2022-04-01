import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:personal_branding/constants/firestore_constants.dart';
import 'package:personal_branding/models/request/register_request.dart';
import 'package:personal_branding/models/request/social_login_request.dart';
import 'package:personal_branding/models/response/session_user_model.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Buttons/widget_forgotpasswordbuttong.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_password_and_confirm_password_fields.dart';
import 'package:personal_branding/widgets/TextFields/widget_password_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';

import '../drawer.dart';

// ignore: must_be_immutable
class Register extends KFDrawerContent {


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  final TextEditingController _confirmPasswordFieldController = TextEditingController();

  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SessionUserModel sessionUserModel;
  Map _userObj = {};
  bool logoutUser = false;

  final String redirectUrl = "https://drahmed.ae/social/handle/linkedin";
  final String clientId = '78gve1yqzry3h7';
  final String clientSecret = 'n4M9wPOCAt8Rfb8Q';

  // late FacebookLogin plugin;
  // final fb = FacebookLogin();
  // String? _sdkVersion;
  // FacebookAccessToken? _token;
  // FacebookUserProfile? _profile;
  // String? _email;
  // String? _imageUrl;


  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Heading1("REGISTER"),
                                  Container(
                                      child: NameField(
                                        hint: "Enter Name",
                                        controller: _nameFieldController,
                                      )
                                  ),
                                  Container(
                                      child: EmailField(
                                        hint: "Enter Email",
                                        controller: _emailFieldController,
                                      )
                                  ),

                                  PasswordFieldAndConfirmPasswordField(
                                      password_hint: "Enter Password",
                                      confirm_password_hint: "Confirm Password",
                                      password_controller: _passwordFieldController,
                                      confirm_password_controller: _confirmPasswordFieldController
                                  ),

                                  ButtonWithWidth(title: "SIGN UP",Width: MediaQuery.of(context).size.width,onPressed:_registerUser,
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
                                SignInButton(
                                  Buttons.LinkedIn,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  onPressed: _registerUserWithLinkedIn,
                                ),
                                Divider(),
                               // ForgotPassword(title: "Forgot Password!",onPressed: () {},)
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
    );
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
        saveUserSession(value);
        print(saveUserSession(value));
        FirebaseMessaging.instance.getToken().then((token) {
          FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
              {
                FirestoreConstants.nickname: sessionUserModel.name,
                FirestoreConstants.photoUrl: '',
                FirestoreConstants.id: sessionUserModel.id,
                'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
                FirestoreConstants.chattingWith: null,
                'Token' : token
              });
        }).catchError((e){
          print(e);
        });

        // FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
        //     {
        //       FirestoreConstants.nickname: sessionUserModel.name,
        //       FirestoreConstants.photoUrl: '',
        //       FirestoreConstants.id: sessionUserModel.id,
        //       'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        //       FirestoreConstants.chattingWith: null
        //     });
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

  _registerUserWithLinkedIn() async {
    print("linkedin Buttin clicked");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LinkedInUserWidget(
      appBar: AppBar(title: const Text("Linkedln Sign Up"),
        centerTitle: true,),
      redirectUrl: redirectUrl,
      clientId: clientId,
      clientSecret: clientSecret,
      destroySession: _checkedLogin(),
      projection:  const [
        ProjectionParameters.id,
        ProjectionParameters.localizedFirstName,
        ProjectionParameters.localizedLastName,
        ProjectionParameters.firstName,
        ProjectionParameters.lastName,
        ProjectionParameters.profilePicture,
      ],
      onGetUserProfile: (linkedInUserModel) async {

        print("Last Name:${linkedInUserModel.user.localizedLastName}");
        print("Email:${linkedInUserModel.user.email!.elements![0].handleDeep!.emailAddress}");

        String? fullName = "${linkedInUserModel.user.localizedFirstName} " + "${linkedInUserModel.user.localizedLastName}";
        print("FirstName:$fullName");
        String? email = linkedInUserModel.user.email!.elements![0].handleDeep!.emailAddress;
        String? userID = linkedInUserModel.user.userId;



        HTTPManager().registerUserWithSocialAccount(SocialLoginRequest(name: fullName, email: email.toString(), id: userID.toString(), provider: "linkedin")).then((value)
        {

          sessionUserModel = value;
          FirebaseMessaging.instance.getToken().then((token) {

            FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
                {
                  FirestoreConstants.nickname: sessionUserModel.name,
                  FirestoreConstants.photoUrl: '',
                  FirestoreConstants.id: sessionUserModel.id,
                  'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
                  FirestoreConstants.chattingWith: null,
                  'Token' : token
                });

          }).catchError((e){
            print(e);
          });

          saveUserSession(value);
          print(saveUserSession(value));
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (buildcontext)=>MainWidget(title: " ")));
          Navigator.of(context).pop();
        });

      },
      onError: (UserFailedAction e) {
        print('Error: ${e.toString()}');
      },
    )
    )
    );
  }

  bool _checkedLogin() {
    getUserSession().then((value) => {
      if (value.id == 0)
        {
          setState(() {
            logoutUser = true;
          })
        }
      else
        {
          setState(() {
            logoutUser = false;
            globalSessionUser = value;
            _isLoading = false;
          }),
        }
    });
    return logoutUser;
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

            saveUserSession(value);
            print(saveUserSession(value));

            FirebaseMessaging.instance.getToken().then((token) {

              FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
                  {
                    FirestoreConstants.nickname: sessionUserModel.name,
                    FirestoreConstants.photoUrl: '',
                    FirestoreConstants.id: sessionUserModel.id,
                    'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
                    FirestoreConstants.chattingWith: null,
                    'Token' : token
                  });

            }).catchError((e){
              print(e);
            });
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

  // ignore: non_constant_identifier_names
  _registerUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      HTTPManager()
          .registerUser(RegisterRequest(email: _emailFieldController.text, password: _passwordFieldController.text, passwordConfirmation: _confirmPasswordFieldController.text, name: _nameFieldController.text))
          .then((value) {
            print(value);
            sessionUserModel = value;

            FirebaseMessaging.instance.getToken().then((token) {

              FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${sessionUserModel.id}").set(
                  {
                    FirestoreConstants.nickname: sessionUserModel.name,
                    FirestoreConstants.photoUrl: '',
                    FirestoreConstants.id: sessionUserModel.id,
                    'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
                    FirestoreConstants.chattingWith: null,
                    'Token' : token
                  });

            }).catchError((e){
              print(e);
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
          _registerUser();
        });
      });
    }
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainWidget(title: '')), (route) => false));
  }

  // Future<void> _updateLoginInfo(res) async {
  //
  //   final token = await res.accessToken;
  //   FacebookUserProfile? profile;
  //   String? email;
  //   String? imageUrl;
  //
  //   if (token != null) {
  //     profile = await res.getUserProfile();
  //     if (token.permissions.contains(FacebookPermission.email.name)) {
  //       email = await res.getUserEmail();
  //     }
  //     imageUrl = await res.getProfileImageUrl(width: 100);
  //   }
  //
  //   setState(() {
  //     _token = token;
  //     _profile = profile;
  //     _email = email;
  //     _imageUrl = imageUrl;
  //   });
  // }
}