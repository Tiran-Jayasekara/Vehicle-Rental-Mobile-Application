
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:travel/pages/navpage/preferances.dart';

import '../../widgets/app_text.dart';
import '../../widgets/app_text_large.dart';
import 'main_page.dart';

class YourBooking extends StatefulWidget {
  const YourBooking({Key? key}) : super(key: key);

  @override
  State<YourBooking> createState() => _YourBookingState();
}

class _YourBookingState extends State<YourBooking> {
  final preferanceservice = preferance();
  List notificationList = [];
  List MessageList = [];
  var savedemail;
  int notification_count = 0;
  final carid = List<String>.generate(10000, (i) => "");
  final Message = List<String>.generate(10000, (i) => "");
  final img = List<String>.generate(10000, (i) => "");
  final booking = List<String>.generate(10000, (i) => "");


  var order = "Cancel Order";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populate();
  }
  Future populate()async{
    final setting = await preferanceservice.getSetting();
    setState(() {
      savedemail = setting.email;
      print(savedemail);
      Notification();
    });
  }
  /*countset()async{
    List booking = [for(var i=0; i<notificationList.length; i+=1) i];
  }*/

  Notification()async {
    var url = 'http://localhost/flutter/order.php';
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
      notification_count++;
      if(notificationList[i]['book'] =='0'){
        switch(notificationList[i]['carid']){
          case "h1":  img[i] = "img/cars/honda/h1.jpeg"; carid[i] = "Carwely";booking[i] = order; break;
          case "h2": img[i] = "img/cars/honda/accord.jpg"; carid[i] = "Accord";booking[i] = order;  break;
          case "h3": img[i] = "img/cars/honda/accordhybrid.jpg"; carid[i] = "Accord Hybrid";booking[i] = order; break;
          case "h4": img[i] = "img/cars/honda/civicRTC.jpg"; carid[i] = "Civic RTC";booking[i] = order; break;
          case "h5": img[i] = "img/cars/honda/insight.jpg"; carid[i] = "Insight";booking[i] = order; break;
          case "h6": img[i] = "img/cars/honda/sisedan.jpg"; carid[i] ="SI Sedan";booking[i] = order; break;

          case "s1":  img[i] = "img/cars/suzuki/swift.jpg"; carid[i] = "Suzuki Swift";booking[i] = order; break;
          case "s2":  img[i] = "img/cars/suzuki/celerio.jpg"; carid[i] = "Suzuki Celerio";booking[i] = order; break;
          case "s3":  img[i] = "img/cars/suzuki/ciaz.jpg"; carid[i] = "Suzuki Ciaz";booking[i] = order; break;
          case "s4":  img[i] = "img/cars/suzuki/ertiga.jpg"; carid[i] = "Suzuki Ertiga";booking[i] = order; break;
          case "s5":  img[i] = "img/cars/suzuki/Kizashi.jpg"; carid[i] = "Suzuki Kizashi";booking[i] = order; break;
          case "s6":  img[i] = "img/cars/suzuki/alto.jpg"; carid[i] = "Suzuki Alto";booking[i] = order; break;

          case "c1":  img[i] = "img/cars/chavolet/boltEUV.jpg"; carid[i] = "Chavolet Bolt EUV ";booking[i] = order; break;
          case "c2":  img[i] = "img/cars/chavolet/boltEV.jpg"; carid[i] = "Chavolet Bolt EV";booking[i] = order; break;
          case "c3":  img[i] = "img/cars/chavolet/camaro.jpg"; carid[i] = "Chavolet Camaro ";booking[i] = order; break;
          case "c4":  img[i] = "img/cars/chavolet/corvette.jpg"; carid[i] = "Chavolet Corvette ";booking[i] = order; break;
          case "c5":  img[i] = "img/cars/chavolet/malibu.jpg"; carid[i] = "Chavolet Malibu ";booking[i] = order; break;
          case "c6":  img[i] = "img/cars/chavolet/spark.jpg"; carid[i] = "Chavolet Spark ";booking[i] = order; break;

          case "b1":  img[i] = "img/cars/benz/AMGHT4.png"; carid[i] = "Benz AMGHT4  ";booking[i] = order; break;
          case "b2":  img[i] = "img/cars/benz/cabriolet.png"; carid[i] = "Benz Cabriolet";booking[i] = order; break;
          case "b3":  img[i] = "img/cars/benz/coupe.png"; carid[i] = "Benz Coupe  ";booking[i] = order; break;
          case "b4":  img[i] = "img/cars/benz/maybach.png"; carid[i] = "Benz Maybach ";booking[i] = order; break;
          case "b5":  img[i] = "img/cars/benz/sedan.png"; carid[i] = "Benz Sidan  ";booking[i] = order; break;
          case "b6":  img[i] = "img/cars/benz/wagon.png"; carid[i] = "Benz Wagon ";booking[i] = order; break;

          case "a1":  img[i] = "img/cars/audi/A5Cabriolet.jpg"; carid[i] = "Audi Cabriolet";booking[i] = order; break;
          case "a2":  img[i] = "img/cars/audi/A6allroad.jpg"; carid[i] = "Audi Allroad";booking[i] = order; break;
          case "a3":  img[i] = "img/cars/audi/rs3sedan.jpg"; carid[i] = "Audi Sedan";booking[i] = order; break;
          case "a4":  img[i] = "img/cars/audi/s5coupe.jpg"; carid[i] = "Audi Coupe";booking[i] = order; break;
          case "a5":  img[i] = "img/cars/audi/TTCoupe.jpg"; carid[i] = "Audi TT Coupe";booking[i] = order; break;
          case "a6":  img[i] = "img/cars/audi/TTRoadster.jpg"; carid[i] = "Audi TT Roadster";booking[i] = order; break;

          case "t1":  img[i] = "img/cars/toyota/Avalon.jpg"; carid[i] = "Toyota Avalon";booking[i] = order; break;
          case "t2":  img[i] = "img/cars/toyota/Camry.jpg"; carid[i] = "Toyota Camry ";booking[i] = order; break;
          case "t3":  img[i] = "img/cars/toyota/CHR.jpg"; carid[i] = "Toyota CHR ";booking[i] = order; break;
          case "t4":  img[i] = "img/cars/toyota/Corolla.jpg"; carid[i] = "Toyota Corolla ";booking[i] = order; break;
          case "t5":  img[i] = "img/cars/toyota/Prius.jpg"; carid[i] = "Toyota Prius ";booking[i] = order; break;
          case "t6":  img[i] = "img/cars/toyota/Yaris.jpg"; carid[i] = "Toyota Yaris";booking[i] = order; break;

          case "v1":  img[i] = "img/van/bongo.jpg"; carid[i] = "Maxda Bongo";booking[i] = order; break;
          case "v2":  img[i] = "img/van/caravan.jpg"; carid[i] = "Nissan Caravan";booking[i] = order; break;
          case "v3":  img[i] = "img/van/dolphin.jpg"; carid[i] = "Toyota Dolphin";booking[i] = order; break;
          case "v4":  img[i] = "img/van/KDH.jpg"; carid[i] = "Toyota KDH";booking[i] = order; break;
          case "v5":  img[i] = "img/van/toyotahiace.jpg"; carid[i] = "Toyota Hiace";booking[i] = order; break;
          case "v6":  img[i] = "img/van/Urvan.jpg"; carid[i] = "Toyota Urvan";booking[i] = order; break;

          case "bike1":  img[i] = "img/bike/cb350.jpg"; carid[i] = "CB350";booking[i] = order; break;
          case "bike2":  img[i] = "img/bike/chaly.jpg"; carid[i] = "Chaly";booking[i] = order; break;
          case "bike3":  img[i] = "img/bike/dio.jpg"; carid[i] = "Honda Dio";booking[i] = order; break;
          case "bike4":  img[i] = "img/bike/rd350.jpg"; carid[i] = "RD 350";booking[i] = order; break;
          case "bike5":  img[i] = "img/bike/gixxer.jpg"; carid[i] = "Gixxer";booking[i] = order; break;
          case "bike6":  img[i] = "img/bike/pulser220.jpg"; carid[i] = "Bajaj Pulser";booking[i] = order; break;

          case "cab1":  img[i] = "img/cab/dmax.jpg"; carid[i] = "D-Max";booking[i] = order; break;
          case "cab2":  img[i] = "img/cab/f150reguler.jpg"; carid[i] = "F150-Reguler";booking[i] = order; break;
          case "cab3":  img[i] = "img/cab/Hilux.jpg"; carid[i] = "Hilux";booking[i] = order; break;
          case "cab4":  img[i] = "img/cab/xenon.jpg"; carid[i] = "Xenon";booking[i] = order; break;

        }
        Message[i] = "Booking Processing";
      }
        if(notificationList[i]['book'] =='1'){
        switch(notificationList[i]['carid']){
          case "h1":  img[i] = "img/cars/honda/h1.jpeg"; carid[i] = "Carwely"; break;
          case "h2": img[i] = "img/cars/honda/accord.jpg"; carid[i] = "Accord";  break;
          case "h3": img[i] = "img/cars/honda/accordhybrid.jpg"; carid[i] = "Accord Hybrid"; break;
          case "h4": img[i] = "img/cars/honda/civicRTC.jpg"; carid[i] = "Civic RTC"; break;
          case "h5": img[i] = "img/cars/honda/insight.jpg"; carid[i] = "Insight"; break;
          case "h6": img[i] = "img/cars/honda/sisedan.jpg"; carid[i] ="SI Sedan"; break;

          case "s1":  img[i] = "img/cars/suzuki/swift.jpg"; carid[i] = "Suzuki Swift"; break;
          case "s2":  img[i] = "img/cars/suzuki/celerio.jpg"; carid[i] = "Suzuki Celerio"; break;
          case "s3":  img[i] = "img/cars/suzuki/ciaz.jpg"; carid[i] = "Suzuki Ciaz"; break;
          case "s4":  img[i] = "img/cars/suzuki/ertiga.jpg"; carid[i] = "Suzuki Ertiga"; break;
          case "s5":  img[i] = "img/cars/suzuki/Kizashi.jpg"; carid[i] = "Suzuki Kizashi"; break;
          case "s6":  img[i] = "img/cars/suzuki/alto.jpg"; carid[i] = "Suzuki Alto"; break;

          case "c1":  img[i] = "img/cars/chavolet/boltEUV.jpg"; carid[i] = "Chavolet Bolt EUV "; break;
          case "c2":  img[i] = "img/cars/chavolet/boltEV.jpg"; carid[i] = "Chavolet Bolt EV"; break;
          case "c3":  img[i] = "img/cars/chavolet/camaro.jpg"; carid[i] = "Chavolet Camaro "; break;
          case "c4":  img[i] = "img/cars/chavolet/corvette.jpg"; carid[i] = "Chavolet Corvette "; break;
          case "c5":  img[i] = "img/cars/chavolet/malibu.jpg"; carid[i] = "Chavolet Malibu "; break;
          case "c6":  img[i] = "img/cars/chavolet/spark.jpg"; carid[i] = "Chavolet Spark "; break;

          case "b1":  img[i] = "img/cars/benz/AMGHT4.png"; carid[i] = "Benz AMGHT4  "; break;
          case "b2":  img[i] = "img/cars/benz/cabriolet.png"; carid[i] = "Benz Cabriolet"; break;
          case "b3":  img[i] = "img/cars/benz/coupe.png"; carid[i] = "Benz Coupe  "; break;
          case "b4":  img[i] = "img/cars/benz/maybach.png"; carid[i] = "Benz Maybach "; break;
          case "b5":  img[i] = "img/cars/benz/sedan.png"; carid[i] = "Benz Sidan  "; break;
          case "b6":  img[i] = "img/cars/benz/wagon.png"; carid[i] = "Benz Wagon "; break;

          case "a1":  img[i] = "img/cars/audi/A5Cabriolet.jpg"; carid[i] = "Audi Cabriolet"; break;
          case "a2":  img[i] = "img/cars/audi/A6allroad.jpg"; carid[i] = "Audi Allroad"; break;
          case "a3":  img[i] = "img/cars/audi/rs3sedan.jpg"; carid[i] = "Audi Sedan"; break;
          case "a4":  img[i] = "img/cars/audi/s5coupe.jpg"; carid[i] = "Audi Coupe"; break;
          case "a5":  img[i] = "img/cars/audi/TTCoupe.jpg"; carid[i] = "Audi TT Coupe"; break;
          case "a6":  img[i] = "img/cars/audi/TTRoadster.jpg"; carid[i] = "Audi TT Roadster"; break;

          case "t1":  img[i] = "img/cars/toyota/Avalon.jpg"; carid[i] = "Toyota Avalon"; break;
          case "t2":  img[i] = "img/cars/toyota/Camry.jpg"; carid[i] = "Toyota Camry "; break;
          case "t3":  img[i] = "img/cars/toyota/CHR.jpg"; carid[i] = "Toyota CHR "; break;
          case "t4":  img[i] = "img/cars/toyota/Corolla.jpg"; carid[i] = "Toyota Corolla "; break;
          case "t5":  img[i] = "img/cars/toyota/Prius.jpg"; carid[i] = "Toyota Prius "; break;
          case "t6":  img[i] = "img/cars/toyota/Yaris.jpg"; carid[i] = "Toyota Yaris"; break;

          case "v1":  img[i] = "img/van/bongo.jpg"; carid[i] = "Maxda Bongo"; break;
          case "v2":  img[i] = "img/van/caravan.jpg"; carid[i] = "Nissan Caravan"; break;
          case "v3":  img[i] = "img/van/dolphin.jpg"; carid[i] = "Toyota Dolphin"; break;
          case "v4":  img[i] = "img/van/KDH.jpg"; carid[i] = "Toyota KDH"; break;
          case "v5":  img[i] = "img/van/toyotahiace.jpg"; carid[i] = "Toyota Hiace"; break;
          case "v6":  img[i] = "img/van/Urvan.jpg"; carid[i] = "Toyota Urvan"; break;

          case "bike1":  img[i] = "img/bike/cb350.jpg"; carid[i] = "CB350"; break;
          case "bike2":  img[i] = "img/bike/chaly.jpg"; carid[i] = "Chaly"; break;
          case "bike3":  img[i] = "img/bike/dio.jpg"; carid[i] = "Honda Dio"; break;
          case "bike4":  img[i] = "img/bike/rd350.jpg"; carid[i] = "RD 350"; break;
          case "bike5":  img[i] = "img/bike/gixxer.jpg"; carid[i] = "Gixxer"; break;
          case "bike6":  img[i] = "img/bike/pulser220.jpg"; carid[i] = "Bajaj Pulser"; break;

          case "cab1":  img[i] = "img/cab/dmax.jpg"; carid[i] = "D-Max"; break;
          case "cab2":  img[i] = "img/cab/f150reguler.jpg"; carid[i] = "F150-Reguler"; break;
          case "cab3":  img[i] = "img/cab/Hilux.jpg"; carid[i] = "Hilux"; break;
          case "cab4":  img[i] = "img/cab/xenon.jpg"; carid[i] = "Xenon"; break;

        }
        Message[i] = "Booking Success";

      }
      if(notificationList[i]['book'] =='2'){
        switch(notificationList[i]['carid']){
          case "h1":  img[i] = "img/cars/honda/h1.jpeg"; carid[i] = "Carwely"; break;
          case "h2": img[i] = "img/cars/honda/accord.jpg"; carid[i] = "Accord";  break;
          case "h3": img[i] = "img/cars/honda/accordhybrid.jpg"; carid[i] = "Accord Hybrid"; break;
          case "h4": img[i] = "img/cars/honda/civicRTC.jpg"; carid[i] = "Civic RTC"; break;
          case "h5": img[i] = "img/cars/honda/insight.jpg"; carid[i] = "Insight"; break;
          case "h6": img[i] = "img/cars/honda/sisedan.jpg"; carid[i] ="SI Sedan"; break;

          case "s1":  img[i] = "img/cars/suzuki/swift.jpg"; carid[i] = "Suzuki Swift"; break;
          case "s2":  img[i] = "img/cars/suzuki/celerio.jpg"; carid[i] = "Suzuki Celerio"; break;
          case "s3":  img[i] = "img/cars/suzuki/ciaz.jpg"; carid[i] = "Suzuki Ciaz"; break;
          case "s4":  img[i] = "img/cars/suzuki/ertiga.jpg"; carid[i] = "Suzuki Ertiga"; break;
          case "s5":  img[i] = "img/cars/suzuki/Kizashi.jpg"; carid[i] = "Suzuki Kizashi"; break;
          case "s6":  img[i] = "img/cars/suzuki/alto.jpg"; carid[i] = "Suzuki Alto"; break;

          case "c1":  img[i] = "img/cars/chavolet/boltEUV.jpg"; carid[i] = "Chavolet Bolt EUV "; break;
          case "c2":  img[i] = "img/cars/chavolet/boltEV.jpg"; carid[i] = "Chavolet Bolt EV"; break;
          case "c3":  img[i] = "img/cars/chavolet/camaro.jpg"; carid[i] = "Chavolet Camaro "; break;
          case "c4":  img[i] = "img/cars/chavolet/corvette.jpg"; carid[i] = "Chavolet Corvette "; break;
          case "c5":  img[i] = "img/cars/chavolet/malibu.jpg"; carid[i] = "Chavolet Malibu "; break;
          case "c6":  img[i] = "img/cars/chavolet/spark.jpg"; carid[i] = "Chavolet Spark "; break;

          case "b1":  img[i] = "img/cars/benz/AMGHT4.png"; carid[i] = "Benz AMGHT4  "; break;
          case "b2":  img[i] = "img/cars/benz/cabriolet.png"; carid[i] = "Benz Cabriolet"; break;
          case "b3":  img[i] = "img/cars/benz/coupe.png"; carid[i] = "Benz Coupe  "; break;
          case "b4":  img[i] = "img/cars/benz/maybach.png"; carid[i] = "Benz Maybach "; break;
          case "b5":  img[i] = "img/cars/benz/sedan.png"; carid[i] = "Benz Sidan  "; break;
          case "b6":  img[i] = "img/cars/benz/wagon.png"; carid[i] = "Benz Wagon "; break;

          case "a1":  img[i] = "img/cars/audi/A5Cabriolet.jpg"; carid[i] = "Audi Cabriolet"; break;
          case "a2":  img[i] = "img/cars/audi/A6allroad.jpg"; carid[i] = "Audi Allroad"; break;
          case "a3":  img[i] = "img/cars/audi/rs3sedan.jpg"; carid[i] = "Audi Sedan"; break;
          case "a4":  img[i] = "img/cars/audi/s5coupe.jpg"; carid[i] = "Audi Coupe"; break;
          case "a5":  img[i] = "img/cars/audi/TTCoupe.jpg"; carid[i] = "Audi TT Coupe"; break;
          case "a6":  img[i] = "img/cars/audi/TTRoadster.jpg"; carid[i] = "Audi TT Roadster"; break;

          case "t1":  img[i] = "img/cars/toyota/Avalon.jpg"; carid[i] = "Toyota Avalon"; break;
          case "t2":  img[i] = "img/cars/toyota/Camry.jpg"; carid[i] = "Toyota Camry "; break;
          case "t3":  img[i] = "img/cars/toyota/CHR.jpg"; carid[i] = "Toyota CHR "; break;
          case "t4":  img[i] = "img/cars/toyota/Corolla.jpg"; carid[i] = "Toyota Corolla "; break;
          case "t5":  img[i] = "img/cars/toyota/Prius.jpg"; carid[i] = "Toyota Prius "; break;
          case "t6":  img[i] = "img/cars/toyota/Yaris.jpg"; carid[i] = "Toyota Yaris"; break;

          case "v1":  img[i] = "img/van/bongo.jpg"; carid[i] = "Maxda Bongo"; break;
          case "v2":  img[i] = "img/van/caravan.jpg"; carid[i] = "Nissan Caravan"; break;
          case "v3":  img[i] = "img/van/dolphin.jpg"; carid[i] = "Toyota Dolphin"; break;
          case "v4":  img[i] = "img/van/KDH.jpg"; carid[i] = "Toyota KDH"; break;
          case "v5":  img[i] = "img/van/toyotahiace.jpg"; carid[i] = "Toyota Hiace"; break;
          case "v6":  img[i] = "img/van/Urvan.jpg"; carid[i] = "Toyota Urvan"; break;

          case "bike1":  img[i] = "img/bike/cb350.jpg"; carid[i] = "CB350"; break;
          case "bike2":  img[i] = "img/bike/chaly.jpg"; carid[i] = "Chaly"; break;
          case "bike3":  img[i] = "img/bike/dio.jpg"; carid[i] = "Honda Dio"; break;
          case "bike4":  img[i] = "img/bike/rd350.jpg"; carid[i] = "RD 350"; break;
          case "bike5":  img[i] = "img/bike/gixxer.jpg"; carid[i] = "Gixxer"; break;
          case "bike6":  img[i] = "img/bike/pulser220.jpg"; carid[i] = "Bajaj Pulser"; break;

          case "cab1":  img[i] = "img/cab/dmax.jpg"; carid[i] = "D-Max"; break;
          case "cab2":  img[i] = "img/cab/f150reguler.jpg"; carid[i] = "F150-Reguler"; break;
          case "cab3":  img[i] = "img/cab/Hilux.jpg"; carid[i] = "Hilux"; break;
          case "cab4":  img[i] = "img/cab/xenon.jpg"; carid[i] = "Xenon"; break;

        }
        Message[i] = "Booking Rejected";

      }
      MessageCheck();

    }
  }
  void MessageCheck(){
    if(notification_count == 5){
      Fluttertoast.showToast(msg: "Your history is Full, Please Clear All",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
  }

  void canselbook(index)async{
    var url = 'http://localhost/flutter/deletenoti.php';
    var res = await http.post(url,body: {
      "carid": notificationList[index]['carid'],
      "email":savedemail,
    });
    var deletenotify = json.decode(res.body);
    if(deletenotify == "success"){
      Fluttertoast.showToast(msg: "Cancel Successfull",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    else{
      Fluttertoast.showToast(msg: "Cancel Faild",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return YourBooking();
        }));
  }
  Future deletehistory()async{
    var url = 'http://localhost/flutter/deletehistory.php';
    var res = await http.post(url,body: {
      "email":savedemail,
    });
    var deletenotify = json.decode(res.body);
    if(deletenotify == "success"){
      Fluttertoast.showToast(msg: "Delete Successfull",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    else{
      Fluttertoast.showToast(msg: "Delete Faild",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return YourBooking();
        }));
  }



  @override
  Widget build(BuildContext context) {
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
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return MainPage();
                      }));
                }, icon: Icon(Icons.backspace)),
                AppLargeText(text: "Your Booking"),
              ],
            ),
          ),


        ),
      ),
      body: RefreshIndicator(
            onRefresh:populate,
       backgroundColor: Colors.red,
       child:ListView.builder(itemBuilder:(context,index){
            return Card(
              child: Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.only(top:40,bottom: 10),
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                img[index]

                            ),
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                      title:Container(
                        margin: EdgeInsets.only(left: 40),
                        child: AppLargeText(text:carid[index],size: 20,),
                      ),

                      subtitle:Container(
                        child: Column(
                          children: [
                            AppLargeText(text:Message[index],size: 20,color: Message[index] =="Booking Success"?Message[index] =="Booking Rejected"?Colors.black:Colors.green:Colors.red),
                            Container(

                              margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                               color: booking[index] ==""?Colors.white:Colors.blue,
                              ),
                              width: 200,
                              height: 30,


                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: GestureDetector(

                                      onTap: (){
                                        canselbook(index);
                                      },
                                      child: AppText(text: booking[index],color: Colors.white,size: 20,),
                                    ),

                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            );
          },
            itemCount: notification_count,
          )
      ),

      bottomNavigationBar: Container(
        height: 40,
        width: 100,

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(left: 275,right: 10),
        child: GestureDetector(

          onTap: (){
            deletehistory();
          },
          child: AppText(text: "Clear All",color: Colors.white,size: 20,),
        ),
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
