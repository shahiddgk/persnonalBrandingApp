import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/careersectiontab.dart';
import 'package:personal_branding/utills/utils.dart';

import 'Pages/Entrepreneur/entrepreneur.dart';
import 'Pages/Professional_Coaching/professional_coaching.dart';
import 'Pages/aboutsectiontab.dart';
import 'Pages/contacts.dart';
import 'Pages/forms.dart';
import 'Pages/home.dart';

class MainWidget extends StatefulWidget {
  MainWidget({required this.title});

  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  bool _isCheckingSession = true;
  bool _isLoading = true;

  @override
  void initState() {
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
      body: KFDrawer(
        scrollable: true,
        controller: KFDrawerController(
          initialPage: Entrepreneur(),
          items: [
            KFDrawerItem.initWithPage(
              text: Text('HOME',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              page: Home(),
            ),
            KFDrawerItem.initWithPage(
              text: const Text(
                'ABOUT',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              page: AboutSection(),
            ),
            KFDrawerItem.initWithPage(
              text: const Text(
                'CAREERS',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              page: CareerSection(),
            ),
            KFDrawerItem.initWithPage(
              text: const Text(
                'GALLERY',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              page: ProfessionalCoaching(),
            ),
            KFDrawerItem.initWithPage(
              text: const Text(
                'STARTUP',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              // icon: Icon(Icons.settings, color: Colors.white),
              page: Entrepreneur(),
            ),
            KFDrawerItem.initWithPage(
              text: const Text(
                'CONTACT',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              // icon: Icon(Icons.settings, color: Colors.white),
              page: Contacts(),
            ),
            _isLoading == false &&
                    _isCheckingSession == false &&
                    globalSessionUser.token != ""
                ? KFDrawerItem(
                    text: const Text(
                      'LOGOUT',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      logoutSessionUser().then((value) => {
                            setState(() {
                              globalSessionUser = value;
                              _isLoading = false;
                            })
                          });
                    },
                  )
                : KFDrawerItem.initWithPage(
                    text: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    // icon: Icon(Icons.settings, color: Colors.white),
                    page: Forms(),
                  ),
          ],
        ),
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              height: 70,
              width: 50,
              child: Center(child: Image.asset("images/logo2.png")),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
