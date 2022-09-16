
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/pages/navpage/YourBooking.dart';
import 'package:travel/pages/navpage/main_page.dart';
import 'package:travel/pages/navpage/my_page.dart';
import 'package:travel/pages/navpage/notification.dart';
import 'package:travel/pages/navpage/preferances.dart';
import 'package:travel/pages/navpage/preferancetwo.dart';
import 'package:travel/vehicle/cars/audi.dart';
import 'package:travel/vehicle/cars/benz.dart';
import 'package:travel/vehicle/cars/carwely.dart';
import 'package:travel/vehicle/cars/chavolet.dart';
import 'package:travel/vehicle/cars/honda.dart';
import 'package:travel/vehicle/cars/suzuki/suzuki.dart';
import 'package:travel/vehicle/cars/toyota.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/app_text_large.dart';
import 'package:http/http.dart' as http;

import '../../userAccount/user.dart';

class HomePage extends StatefulWidget {
  final recivemail;
  const HomePage({Key? key,this.recivemail}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final preferanceservice = preferance();

  var id = "";

  var savedemail;
  int notification_count = 0;

  List productList = [];
  List notificationList = [];

  List available = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populate();
  }
  getdetails()async {
    var url = 'http://localhost/flutter/user.php';
    var res = await http.post(url,body: {
      "username": savedemail,
    });
    productList = json.decode(res.body);
    Notification();
    return productList;
  }

  Notification()async {
    var url = 'http://localhost/flutter/notification.php';
    var res = await http.post(url,body: {
      "email": savedemail,
    });
    if(json.decode(res.body) == "faild"){
      print("faild");
    }else{
      notificationList = json.decode(res.body);
      setState(() {
        countnotification();
      });
      return notificationList;
    }
  }

  countnotification(){
    for(var i = 0; i< notificationList.length; i++){
      if(notificationList[i]['book'] =='1' || notificationList[i]['book'] =='2'){
        notification_count++;
        print(notification_count);
      }else{
      }
    }
  }

  void populate()async{
    final setting = await preferanceservice.getSetting();
    setState(() {
      savedemail = setting.email;
      print(savedemail);
      getdetails();


    });
  }


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(150),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),

          padding: EdgeInsets.only(top: 40,bottom: 20),
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Message(),
                      ));
                    }, icon: Icon(Icons.notifications_active),color: notification_count ==0?Colors.white:Colors.red,iconSize: 30,),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child:AppLargeText(text:notification_count.toString(),color: notification_count ==0?Colors.green:Colors.white,size: 15,),
                    ),
                  ],

                 ),

          Container(
            width: 100,
            margin: EdgeInsets.only(bottom: 0),
            child: GestureDetector(
              child: Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        "img/eagle1.png"

                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return Mypage();
                      print(widget.recivemail);
                    }));
              },
            ),

          ),

                IconButton(onPressed: (){
                  print(savedemail);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => User(recivemail:productList),
                  ));
                }, icon: Icon(Icons.person),iconSize: 30,color: Colors.white,),
              ],
            ),
          ),


        ),
      ),

      body: ListView(
        children: [

          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            child: AppLargeText(text: "Eagle Rent"),
          ),
          SizedBox(height: 25,),
          Container(
            child: TabBar(
              labelPadding: EdgeInsets.only(left: 20,right: 20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.redAccent,
              tabs: [
                Tab(text: "Car"),
                Tab(text: "Bike"),
                Tab(text: "Van"),
                Tab(text: "Cab"),
              ],
              controller: _tabController,
            ),
          ),
          Container(
            height: 550,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),

            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cars/honda/h1.jpeg",

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return Honda();
                                    }));
                              },
                            ),

                          ),
                            AppText(text: "Honda",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cars/suzuki/s3.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return Suzuki();
                                    }));
                              },
                            ),

                          ),
                          AppText(text: "Suzuki",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cars/chavolet/c1.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return Chavolet();
                                    }));
                              },
                            ),

                          ),
                          AppText(text: "Chavolet",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cars/benz/b1.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return Benz();
                                    }));
                              },
                            ),

                          ),
                          AppText(text: "Benz",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cars/audi/a1.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return Audi();
                                    }));
                              },
                            ),

                          ),
                          AppText(text: "Audi",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    "img/cars/toyota/t1.jpg"

                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context){
                                  return Toyota();
                                }));
                          },
                        ),

                          ),
                          Container(
                            child: GestureDetector(
                              child: AppText(text: "Toyota",color: Colors.black),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/bike/cb350.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"bike1"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "CB 350",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/bike/chaly.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"bike2"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Chaly",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/bike/dio.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"bike3"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Honda Dio",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/bike/rd350.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"bike4"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Yamaha RD350",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/bike/gixxer.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"bike5"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Gixxer",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/bike/pulser220.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"bike6"),
                                ));
                              },
                            ),

                          ),
                          Container(
                            child: GestureDetector(
                              child: AppText(text: "Pulser 220",color: Colors.black),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/van/bongo.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"v1"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Maxda Bongo",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/van/caravan.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"v2"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Nissan Caravan",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/van/dolphin.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"v3"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Toyota Dolphin",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/van/KDH.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"v4"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Toyota KDH",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/van/toyotahiace.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"v5"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Toyota Haice",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/van/Urvan.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"v6"),
                                ));
                              },
                            ),

                          ),
                          Container(
                            child: GestureDetector(
                              child: AppText(text: "Nissan Urvan",color: Colors.black),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cab/dmax.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"cab1"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "D-Max",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cab/f150reguler.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"cab2"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "F 150 Reguler",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cab/Hilux.jpg"
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"cab3"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Hilux",color: Colors.black),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 20,right: 50),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "img/cab/xenon.jpg"

                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Carwely(carid:"cab4"),
                                ));
                              },
                            ),

                          ),
                          AppText(text: "Xenon",color: Colors.black),
                        ],
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class setting{
  final email;
  setting(
      {required this.email}
      );
}
