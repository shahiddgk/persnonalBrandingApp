import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/models/request/register_request.dart';
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

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                                  ForgotPassword(title: "Forgot Password!",onPressed: () {},)
                                ],
                              )
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
    ));
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
}