import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_branding/Pages/about.dart';
import 'package:personal_branding/Pages/careers.dart';
import 'package:personal_branding/Pages/login.dart';
import 'package:personal_branding/utills/utils.dart';
import 'package:personal_branding/widgets/widget_testimonial_picture_details.dart';

class MenuPage extends StatefulWidget {

  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  bool _isCheckingSession = true;
  bool _isLoading = true;
  
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
  Widget build(BuildContext context) => Theme(
    data: ThemeData.dark(),
    child: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     child:  _isLoading == false &&
              //         _isCheckingSession == false &&
              //         globalSessionUser.token != ""
              //         ? Row(
              //       children: [
              //         TextButton(onPressed: (){}, child: Text(globalSessionUser.name,style: TextStyle(color: Colors.white),)),
              //         TextButton(child: const Text('  Logout',style: TextStyle(color: Colors.white),),onPressed: (){
              //           setState(() {
              //             _isLoading = true;
              //           });
              //           logoutSessionUser().then((value) => {
              //             setState(() {
              //               globalSessionUser = value;
              //               _isLoading = false;
              //             })
              //           });
              //         },)
              //       ],
              //     ): TextButton(child:  const Text('  Login',style: TextStyle(color: Colors.white),),onPressed: (){
              //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
              //     },)
              // ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  height: 70,
                  width: 50,
                  child: Center(child: Image.asset("images/logo2.png")),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: MenuItems.all.map(buildMenuItem).toList(),
              ),
              Spacer(flex: 2,)
            ],
          )
      ),
    ),
  );

  Widget buildMenuItem(MenuItem item)=>ListTileTheme(
    selectedTileColor: Colors.white,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: widget.currentItem == item,
      minLeadingWidth: 20,
      title: Text(item.title),
      onTap: ()=> widget.onSelectedItem(item),
    ),
  );
}


// class MenuPage extends StatelessWidget {
//
//   final MenuItem currentItem;
//   final ValueChanged<MenuItem> onSelectedItem;
//
//   const MenuPage({
//     Key? key,
//     required this.currentItem,
//     required this.onSelectedItem,
// }) : super(key: key);
//
//
// //   @override
// //   Widget build(BuildContext context) => Theme(
// //     data: ThemeData.dark(),
// //     child: Scaffold(
// //       backgroundColor: Colors.black,
// //       body: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               width: MediaQuery.of(context).size.width * 0.3,
// //               height: MediaQuery.of(context).size.height * 0.1,
// //               child: Container(
// //                 height: 70,
// //                 width: 50,
// //                 child: Center(child: Image.asset("images/logo2.png")),
// //               ),
// //             ),
// //             Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: MenuItems.all.map(buildMenuItem).toList(),
// //             ),
// //             Spacer(flex: 2,)
// //           ],
// //         )
// //       ),
// //       ),
// //   );
// //
// //   Widget buildMenuItem(MenuItem item)=>ListTileTheme(
// //     selectedTileColor: Colors.white,
// //     child: ListTile(
// //       selectedTileColor: Colors.black26,
// //       selected: currentItem == item,
// //       minLeadingWidth: 20,
// //       title: Text(item.title),
// //       onTap: ()=> onSelectedItem(item),
// //     ),
// //   );
// //
// // }

class MenuItems{
  static const home = MenuItem('Home');
  static const about = MenuItem('About');
  static const career = MenuItem('Career');
  static const startup = MenuItem('Start Up');
  static const gallery = MenuItem('Gallery');
  static const contacts = MenuItem('Contacts');
  //static const login = MenuItem('Login');

  static const all = <MenuItem>[
    home,
    about,
    career,
    startup,
    gallery,
    contacts,
   // login
  ];

}

class MenuItem{
  final String title;
  const MenuItem(this.title);
}
