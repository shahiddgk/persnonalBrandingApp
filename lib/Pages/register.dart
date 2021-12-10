import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Buttons/widget_forgotpasswordbuttong.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_password_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';

// ignore: must_be_immutable
class Register extends KFDrawerContent {


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
      // ),
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
                                  Container(
                                      child: PasswordField(hint: "Enter Password",
                                        controller: _passwordFieldController,)
                                  ),
                                  Button(title: "SIGN UP",Width: MediaQuery.of(context).size.width,onPressed: (){
                                    _SignUp();
                                  },
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
    );
  }

  // ignore: non_constant_identifier_names
  void _SignUp() {
    if(_formKey.currentState!.validate()){
      print("Success");
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("SignUp success")));
    }
  }
}