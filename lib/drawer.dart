import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Pages/careersectiontab.dart';
import 'package:personal_branding/network/http_manager.dart';
import 'package:personal_branding/utills/utils.dart';
import 'Pages/aboutsectiontab.dart';
import 'Pages/Achievement/achievement.dart';
import 'Pages/forms.dart';
import 'Pages/login.dart';
import 'Pages/register.dart';
import 'Pages/Biography/biography.dart';
import 'Pages/careers.dart';
import 'Pages/contacts.dart';
import 'Pages/Entrepreneur/entrepreneur.dart';
import 'Pages/experience.dart';
import 'Pages/Future_Goals/future_goals.dart';
import 'Pages/home.dart';
import 'Pages/partnership.dart';
import 'Pages/Professional_Coaching/professional_coaching.dart';
import 'Pages/Testimonials/testimonials.dart';
import 'utills/class_builder.dart';

class MainWidget extends StatefulWidget {
  MainWidget({required this.title});
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;
  bool _isCheckingSession = true;
  bool _isLoading = true;
  bool _isToken = true;
  String Token = '';

  @override
  void initState() {
    super.initState();
    _checkedLogin();
    _checkToken();
    _drawerController = KFDrawerController(
      initialPage: Home(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('HOME', style: TextStyle(color: Colors.white, fontSize: 18)),
          // icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'ABOUT',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          //  icon: Icon(Icons.account_box, color: Colors.white),
          page: AboutSection(),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'BIOGRAPHY',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.notifications_active, color: Colors.white),
        //   page: Biography(),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'EXPERIENCE',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.settings, color: Colors.white),
        //   page: Experience(),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'ACHIEVEMENT',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.trending_up, color: Colors.white),
        //   page: Achievement(),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'TESTIMONIALS',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.settings, color: Colors.white),
        //   page: Testimonials(),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'FUTURE GOALS',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.av_timer, color: Colors.white),
        //   page: FutureGoals(),
        // ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'CAREERS',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: CareerSection(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'GALLERY',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          //  icon: Icon(Icons.settings, color: Colors.white),
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
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'Partnership',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.settings, color: Colors.white),
        //   page: Partnership(),
        // ),
       KFDrawerItem.initWithPage(
          text: const Text(
            'FORM',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Forms(),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'REGISTER',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   // icon: Icon(Icons.settings, color: Colors.white),
        //   page: Register(),
        // ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'CONTACT',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Contacts(),
        ),
      ],
    );
  }

  Future _checkedLogin() async {
    await getUserSession().then((value) => {
      if (value.id == null)
        {
          setState(() {
            _isCheckingSession = false;
            _isLoading = false;
          })
        }
      else
        {
          setState(() {
            globalSessionUser = value;
            _isLoading = false;
          }),
        }
    });
  }

  Future _checkToken() async {
    await getUserSessionToken().then((value) => {
      if (value.token == null)
        {
          setState(() {
            _isCheckingSession = false;
            _isToken = false;
          })
        }
      else
        {
          setState(() {
            generalResponseModel = value;
            _isToken = false;
          }),
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
                  height: 70,
                  width: 50,
              child: Center(
                child: Image.asset("images/logo2.png")
              ),
                ),

          ),
        ),
        footer: _isLoading == false && _isToken== false ? globalSessionUser.id != 0 ? generalResponseModel.status == "Token is Expired" ?logoutSessionUser() : KFDrawerItem(
          text: const Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: (){
            setState(() {
              Token = generalResponseModel.token;
              print(Token);
            });
            logoutSessionUser();
            HTTPManager().logoutuser(Token).then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: " ")));
            }
            ).catchError((e) {
              print(e);
              setState(() {
                _isLoading = false;
              });
              showAlert(context, e.toString(), true, () {}, () {});
            });

          },
        ) : null : null,
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