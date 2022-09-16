
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/Admin/AdminHomePage.dart';
import 'package:travel/Admin/book/YourBooking.dart';
import 'package:travel/Admin/contact.dart';
import '../pages/navpage/home_page.dart';
import '../pages/navpage/preferancetwo.dart';
import '../pages/navpage/satisfy.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  final service = preferancePerson();

  var savedemail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*populatetwo();*/
  }

  List pages =[
    AdminHomePage(),
    YourBooking(),
    SearchUser(),
    Satisfy(),
  ];
  int currentIndex =  0;
  void Tap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        /*unselectedFontSize: 0,
          selectedFontSize: 0,*/
          iconSize: 25,
          //backgroundColor: Colors.red,
          type: BottomNavigationBarType.shifting,
          onTap: Tap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          //showSelectedLabels: false,
          // showUnselectedLabels: false,
          elevation: 0,
          items:[
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.houseUser),label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label:"Booking"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search),label:"Search"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.comment),label:"Person"),
          ]
      ),
    );
  }
}
