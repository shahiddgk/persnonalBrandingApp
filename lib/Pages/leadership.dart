import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/drawer.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/Headings/widget_heading1.dart';
import 'package:personal_branding/widgets/Headings/widget_heading2withdescription.dart';
import 'package:personal_branding/widgets/widget_eye_with_name.dart';
import 'package:personal_branding/widgets/widget_percentage_bar.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'login.dart';

class Leadership extends StatefulWidget {

  @override
  _LeadershipState createState() => _LeadershipState();
}

class _LeadershipState extends State<Leadership> {


  bool _isCheckingSession = true;
  bool _isLoading = true;
  List EyeName = [
    EyeWithName(Name: 'Displays integrity',),
    EyeWithName(Name: 'Holds themselves accountability',),
    EyeWithName(Name: 'Promotes a vision',),
    EyeWithName(Name: 'Helps others develop',),
    EyeWithName(Name: 'Shows honesty',),
    EyeWithName(Name: 'Displays courage',),
    EyeWithName(Name: 'Values relationships',),
    EyeWithName(Name: 'Practices active listening',),
    EyeWithName(Name: 'confronting conflicts',),
  ];

  double percent = 90;

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
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkedLogin();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
        child: Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading == false
              && _isCheckingSession == false
              && globalSessionUser.id != 0 ?
          IconButton(onPressed: (){
            setState(() {
              _isLoading = true;
            });
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
        leading: MenuWidget(),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*1/70,left: 20,right: 20,bottom: MediaQuery.of(context).size.height*1/70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Heading1("LEADERSHIP SKILLS"),

                  Heading2WithDescription("WHAT MAKES A GOOD LEADER","Good leaders are able to lead their team to meet goals effectively, and on time, while acknowledging individual needs. They possess the best skills relevant to the tasks at hand to manage the different personalities within the team and get everyone to work together to meet the overarching goal."),

                  PercentageBar(Percentage: 100, HeadingName: 'CONFIDENCE', Description: 'Be Confident what you do',),

                  PercentageBar(Percentage: 100, HeadingName: 'DECISIVENESS', Description: 'Make Decision & Act',),

                  PercentageBar(Percentage: 90, HeadingName: 'INTUITION', Description: 'Experience, Knowledge and intuition',),

                  PercentageBar(Percentage: 96, HeadingName: 'EMPATHY', Description: 'Knowing how to motivate',),

                  Heading2WithDescription("A TRUE LEADER", "A true leader does more than manage others. They enable the individuals on their team to reach their highest potentials. By being a true leader, you show others that you can inspire and motivate your team for the good of the organization. Setting yourself apart as this type of leader will require having certain qualities that establish trust and respect within your team."),

                  ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return EyeName[index];
                       }) : ListView.builder(
                    itemCount: EyeName.length,
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return EyeName[index];
                      })
                      ],
                    ),),
                  ],
                 ),),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<bool> _onWillPop() async {
    return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainWidget(title: ' '))));
  }
}
