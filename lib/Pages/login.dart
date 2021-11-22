import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/widgets/Buttons/widget_forgotPasswordButtong.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:  widget.onMenuPressed, icon: Icon(Icons.menu),),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*1/70,left: 10,right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(23),
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
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
                                Button(title: "SignIn",Width: MediaQuery.of(context).size.width,onPressed: (){
                                    _SignIn();
                                    },
                                  ),
                                ForgotPassword(title: "Forgot Password!",onPressed: () {},)
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
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _SignIn() {
    if(_formKey.currentState!.validate()) {
      print("Success");
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("Login success")));
    }
  }
}