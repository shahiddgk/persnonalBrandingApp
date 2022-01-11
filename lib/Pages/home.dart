import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:personal_branding/Drawer/widget_menu_widget.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/Pages/register.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  bool _isCheckingSession = true;
  bool _isLoading = true;

  final urlImages = [
    "images/1.JPG","images/2.JPG","images/5.JPG"
  ];

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
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _isLoading == false
            && _isCheckingSession == false
            && globalSessionUser.id != 0 ? Text("Welcome ${globalSessionUser.name}") : null,
        leading: MenuWidget(),
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
                child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));}, child: Text("SIGN UP ",style: TextStyle(color: Colors.black),),
                ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
              const Text(" | ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 5),
                height: 35,
                child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));}, child: Text("SIGN IN ",style: TextStyle(color: Colors.black),),
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black)),),
            ],)
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
              child: CarouselSlider.builder(
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex){
                  final  urlImage = urlImages[index];
                  return buildImage(urlImage,index);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: Duration(seconds: 4),
                  onPageChanged: (index, reason) => setState(()=>activeIndex = index),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Align(alignment:Alignment.bottomLeft,child: Container(child: Text("Hello, I'M",style: TextStyle(color: Colors.white,fontSize: 22),))),
                    Align(alignment:Alignment.bottomLeft,child: Container(child: Text("DR.AHMED HUSSAIN",style: TextStyle(color: Colors.white,fontSize: 22),))),
                    Align(alignment:Alignment.bottomLeft,child: Container(child: Text("ENTREPRENUR/INFLUENCER",style: TextStyle(color: Colors.white,fontSize: 10),))),

                  ],
                ),
            ),
            Padding(padding:EdgeInsets.only(bottom: 10),child: Align(alignment: Alignment.bottomCenter,child: buildIndicator())),
          ],
        ),
      )
    ));
  }

  Widget buildImage(String urlImage, int index) => Container(
    color: Colors.grey,
    child: Container(
        alignment: Alignment.bottomLeft,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage(urlImages[index]),
            fit: BoxFit.cover
        )
       ),
      child: Column(
      // children: [
      //   Image.asset("1.JPG"),
      // ],
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
    )),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: urlImages.length,
    effect: JumpingDotEffect(
      dotColor: Colors.white,
      dotWidth: 10,dotHeight: 10,
    ),
  );

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context,true),
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
}
