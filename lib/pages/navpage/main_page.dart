
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/pages/navpage/YourBooking.dart';
import 'package:travel/pages/navpage/contact.dart';
import 'package:travel/pages/navpage/home_page.dart';
import 'package:travel/pages/navpage/my_page.dart';
import 'package:travel/pages/navpage/preferancetwo.dart';
import 'package:travel/pages/navpage/satisfy.dart';
import 'package:travel/pages/navpage/search.dart';

class MainPage extends StatefulWidget {
  /*final recivemail;*/
  const MainPage({Key? key, /*this.recivemail,*/}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final service = preferancePerson();

  var savedemail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*populatetwo();*/
  }

  /*void populatetwo()async{
    final setting = await service.getSetting();
    setState(() {
      savedemail = setting.email;
      print(savedemail);
    });
  }*/
  List pages =[
    HomePage(),
    YourBooking(),
    Contact(),
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
          BottomNavigationBarItem(icon: Icon(Icons.phone),label:"Contact Us"),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.comment),label:"Person"),
        ]
      ),
    );
  }
}

/*
class setting{
  final email;
  setting(
      {required this.email}
      );
}*/
