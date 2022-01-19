import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/constants/firestore_constants.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Buttons/widget_button_with_widthn.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/TextFields/widget_email_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_message_field.dart';
import 'package:personal_branding/widgets/TextFields/widget_name_field.dart';
import 'package:personal_branding/widgets/Buttons/widget_button.dart';
import 'package:personal_branding/widgets/widget_contacts_icon_description.dart';

import '../drawer.dart';

// ignore: must_be_immutable
class Contacts extends KFDrawerContent {


  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _messageFieldController = TextEditingController();
  bool _isCheckingSession = true;
  bool _isLoading = true;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkedLogin();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading == false
              && _isCheckingSession == false
              && globalSessionUser.id != 0 ?
          IconButton(onPressed: (){
            setState(() {
              _isLoading = true;
            });
            // FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc("${globalSessionUser.id}").update(
            //     {
            //       'Token': ' '
            //     }
            // );
            googleSignIn.signOut();
            googleSignIn.disconnect();
            FacebookAuth.i.logOut();
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
            globalSessionUser.token != ""? Text("Welcome ${globalSessionUser.name}") : null,
       // leading: MenuWidget(),
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
                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Heading1("CONTACTS"),

                              Heading2WithDescription("LET KEEP IN TOUCH","Feel free to send me direct email.I am open to suggestions and communicative about ideas and bringing something new & big change this world. Let's make it worth a while we live in this world."),

                              ContactsIconDescription(Icons.location_on_sharp, "Dr. Ahmed Hussein", "PO Box 73515 - Abu Dhabi," ,"United Arab Emirates.",Icons.email, "Email", "ahmed@drahmed.ae", Icons.phone, "Phone", "+123-456-7890", "I'm also on Social Networks"," We can connect through social meida platforms as well.",(){},(){},(){},(){},(){}),

                              Heading2("DROP ME A LINE"),

                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NameField(hint: "Your Name",controller: _nameFieldController,),

                                    EmailField(hint: "Your Email",controller: _emailFieldController,),

                                    MessageField(hint: "Enter Message", controller: _messageFieldController,),

                                    Button(title: "SAY HELLO",onPressed: _sendContact,),
                                  ],
                                ),)

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

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }

  _sendContact() {
    if (_formKey.currentState!.validate())
    {
      print(_emailFieldController.text);
    }
  }
}