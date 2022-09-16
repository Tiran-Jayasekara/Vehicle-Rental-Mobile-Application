
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/Admin/adminhome.dart';
import 'package:travel/pages/navpage/main_page.dart';
import 'package:travel/vehicle/cars/honda.dart';
import 'package:travel/vehicle/cars/date.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/app_text_large.dart';
import 'package:http/http.dart' as http;

class Carwely extends StatefulWidget {
  var carid;
  Carwely({Key? key,  this.carid}) : super(key: key);

  @override
  State<Carwely> createState() => _CarwelyState();
}

class _CarwelyState extends State<Carwely> {
  TextEditingController price = TextEditingController();
  var selectedradio;
  var rentprice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRentprice();
    run();
  }
  var id = "";
  var honda1 = "";
  var name = "";
  var seat = "";
  var speed = "";
  var weight = "";
  var capacity = "";
  var leater = "";
  var color = "";
  var dbid = "";
  var car = "";


  List productList = [];
  List PriceList = [];
  var rentvalue;
  var honda0 = "";
  var honda2 = "";

  setselectedradio() async {
    print(selectedradio);
    if(selectedradio == "0" || selectedradio =="1"){
      if(widget.carid == 'h1' || widget.carid == 'h2' ||widget.carid == 'h3' ||widget.carid == 'h4' ||widget.carid == 'h5' ||widget.carid == 'h6'){
        setState(() {
          dbid = '1';
        });

        switch(widget.carid){
          case "h1" : car = 've1';break;
          case "h2" : car = 've2';break;
          case "h3" : car = 've3';break;
          case "h4" : car = 've4';break;
          case "h5" : car = 've5';break;
          case "h6" : car = 've6';break;
        }
        setAvailable();
      }
      if(widget.carid == 's1' || widget.carid == 's2' ||widget.carid == 's3' ||widget.carid == 's4' ||widget.carid == 's5' ||widget.carid == 's6'){
        setState(() {
          dbid = '2';
        });

        switch(widget.carid){
          case "s1" : car = 've1';break;
          case "s2" : car = 've2';break;
          case "s3" : car = 've3';break;
          case "s4" : car = 've4';break;
          case "s5" : car = 've5';break;
          case "s6" : car = 've6';break;
        }
        setAvailable();
      }
      if(widget.carid == 'c1' || widget.carid == 'c2' ||widget.carid == 'c3' ||widget.carid == 'c4' ||widget.carid == 'c5' ||widget.carid == 'c6'){
        setState(() {
          dbid = '3';
        });

        switch(widget.carid){
          case "c1" : car = 've1';break;
          case "c2" : car = 've2';break;
          case "c3" : car = 've3';break;
          case "c4" : car = 've4';break;
          case "c5" : car = 've5';break;
          case "c6" : car = 've6';break;
        }
        setAvailable();
      }
      if(widget.carid == 'b1' || widget.carid == 'b2' ||widget.carid == 'b3' ||widget.carid == 'b4' ||widget.carid == 'b5' ||widget.carid == 'b6'){
        setState(() {
          dbid = '4';
        });

        switch(widget.carid){
          case "b1" : car = 've1';break;
          case "b2" : car = 've2';break;
          case "b3" : car = 've3';break;
          case "b4" : car = 've4';break;
          case "b5" : car = 've5';break;
          case "b6" : car = 've6';break;
        }
        setAvailable();
      }
      if(widget.carid == 'a1' || widget.carid == 'a2' ||widget.carid == 'a3' ||widget.carid == 'a4' ||widget.carid == 'a5' ||widget.carid == 'a6'){
        setState(() {
          dbid = '5';
        });

        switch(widget.carid){
          case "a1" : car = 've1';break;
          case "a2" : car = 've2';break;
          case "a3" : car = 've3';break;
          case "a4" : car = 've4';break;
          case "a5" : car = 've5';break;
          case "a6" : car = 've6';break;
        }
        setAvailable();
      }
      if(widget.carid == 't1' || widget.carid == 't2' ||widget.carid == 't3' ||widget.carid == 't4' ||widget.carid == 't5' ||widget.carid == 't6'){
        setState(() {
          dbid = '6';
        });

        switch(widget.carid){
          case "t1" : car = 've1';break;
          case "t2" : car = 've2';break;
          case "t3" : car = 've3';break;
          case "t4" : car = 've4';break;
          case "t5" : car = 've5';break;
          case "t6" : car = 've6';break;
        }
        setAvailable();
      }

      if(widget.carid == 'v1' || widget.carid == 'v2' ||widget.carid == 'v3' ||widget.carid == 'v4' ||widget.carid == 'v5' ||widget.carid == 'v6'){
        setState(() {
          car = 've1';
        });
        setAvailable2();
      }
      if(widget.carid == 'bike1' || widget.carid == 'bike2' ||widget.carid == 'bike3' ||widget.carid == 'bike4' ||widget.carid == 'bike5' ||widget.carid == 'bike6'){
        setState(() {
          car = 've1';
        });
        setAvailable2();
      }
      if(widget.carid == 'cab1' || widget.carid == 'cab2' ||widget.carid == 'cab3' ||widget.carid == 'cab4'){
        setState(() {
          car = 've1';
        });
        setAvailable2();
      }

    }else{
     /* Fluttertoast.showToast(msg: "Please Select Availability",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );*/
    }

  }

  setAvailable() async {
    var url = "http://localhost/flutter/Admin/setavailability.php"   /*"http://192.168.0.127/flutter/resetpassword.php"*/;
    var response = await http.post(url,body:{
    "dbid" : dbid,
    "car" : car,
    "selectedradio":selectedradio,

    });
    var data = json.decode(response.body);
    if(data == "success"){
      Fluttertoast.showToast(msg: "Availability Set Successfull",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );

    }
    else{
      Fluttertoast.showToast(msg: "Availability Set unsuccess",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return AdminMainPage();
        }));
  }
  setAvailable2() async {
    var url = "http://localhost/flutter/Admin/setavailability.php"   /*"http://192.168.0.127/flutter/resetpassword.php"*/;
    var response = await http.post(url,body:{
      "dbid" : id,
      "car" : car,
      "selectedradio":selectedradio,

    });
    var data = json.decode(response.body);
    if(data == "success"){
      Fluttertoast.showToast(msg: "Availability Set Successfull",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );

    }
    else{
      Fluttertoast.showToast(msg: "Availability Set unsuccess",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return AdminMainPage();
        }));
  }


  getdetails()async {
    var url = 'http://localhost/flutter/car.php';
    var res = await http.post(url,body: {
      "id": id,
    });
    productList = json.decode(res.body);
    print(productList[0]['ve1']);
    print(productList[0]['ve2']);
    setState(() {
      setcar();
    });
    return productList;

  }

  getRentprice()async {
    var url = 'http://localhost/flutter/Admin/watchrentprice.php';
    var res = await http.post(url,body: {
      "carid": widget.carid,
    });
    PriceList = json.decode(res.body);
    setState(() {
      rentvalue = PriceList[0]['rent'];
    });
  }

  setRentPrice() async {
    if(price.text == ""){
    if(price.text == "" && selectedradio == null){
      Fluttertoast.showToast(msg: "Please set Availability Or Rent price",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }else{
    }
    }else{
      var url = "http://localhost/flutter/Admin/rentprice.php"   /*"http://192.168.0.127/flutter/resetpassword.php"*/;
      var response = await http.post(url,body:{
        "carid" : widget.carid,
        "rent" : price.text,

      });
      var data = json.decode(response.body);
      if(data == "success"){
        Fluttertoast.showToast(msg: "Rent Price Set Successfull",toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );

      }
      else{
        Fluttertoast.showToast(msg: "Rent Price set Unsuccess",toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return AdminMainPage();
          }));
    }

  }

  void setcar(){
    if(productList[0]['ve1'] == "1"){
      honda0 = "Available";
    }else{
      honda0 = "Not Available";
    }
    if(productList[0]['ve2'] == "1"){
      honda2 = "Available";
    }else{
      honda2 = "Not Available";
    }
  }

  void run(){
    switch(widget.carid){
      case "h1": honda1 = "img/cars/honda/h1.jpeg";
      name = "Carwely";
      seat = "4";
      speed = "250KMPH";
      weight = "1000KG";
      capacity = "200KG";
      leater =  "15KM";
      color = "white";
      break;
      case "h2": honda1 = "img/cars/honda/accord.jpg";
      name = "Accord";
      seat = "2";
      speed = "200KMPH";
      weight = "1250KG";
      capacity = "250KG";
      leater =  "20KM";
      color = "white";
      break;
      case "h3": honda1 = "img/cars/honda/accordhybrid.jpg";
      name = "Accord Hybrid";
      seat = "4";
      speed = "250KMPH";
      weight = "1000KG";
      capacity = "200KG";
      leater =  "15KM";
      color = "white";
      break;
      case "h4":
        honda1 = "img/cars/honda/civicRTC.jpg";
        name = "Civic RTC";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
      break;
      case "h5":
        honda1 = "img/cars/honda/insight.jpg";
        name = "Insight";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
      break;
      case "h6":
        honda1 = "img/cars/honda/sisedan.jpg";
        name = "SI Sidan";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
      break;
      case "s1":
        honda1 = "img/cars/suzuki/swift.jpg";
      name = "Swift";
      seat = "4";
      speed = "250KMPH";
      weight = "1000KG";
      capacity = "200KG";
      leater =  "15KM";
      color = "white";
      break;
      case "s2":
        honda1 = "img/cars/suzuki/celerio.jpg";
      name = "Celerio";
      seat = "2";
      speed = "200KMPH";
      weight = "1250KG";
      capacity = "250KG";
      leater =  "20KM";
      color = "white";
      break;
      case "s3":
        honda1 = "img/cars/suzuki/ciaz.jpg";
      name = "Ciaz";
      seat = "4";
      speed = "250KMPH";
      weight = "1000KG";
      capacity = "200KG";
      leater =  "15KM";
      color = "white";
      break;
      case "s4":
        honda1 = "img/cars/suzuki/ertiga.jpg";
        name = "Ertiga";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "s5":
        honda1 = "img/cars/suzuki/Kizashi.jpg";
        name = "Kizashi";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "s6":
        honda1 = "img/cars/suzuki/alto.jpg";
        name = "Alto";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "c1":
        honda1 = "img/cars/chavolet/boltEUV.jpg";
        name = "Bolt EVU";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "c2":
        honda1 =  "img/cars/chavolet/boltEV.jpg";
        name = "Bolt EV";
        seat = "2";
        speed = "200KMPH";
        weight = "1250KG";
        capacity = "250KG";
        leater =  "20KM";
        color = "white";
        break;
      case "c3":
        honda1 = "img/cars/chavolet/camaro.jpg";
        name = "Camaro";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "c4":
        honda1 = "img/cars/chavolet/corvette.jpg";
        name = "Corvette";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "c5":
        honda1 = "img/cars/chavolet/malibu.jpg";
        name = "Malibu";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "c6":
        honda1 = "img/cars/chavolet/spark.jpg";
        name = "Spark";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "b1":
        honda1 = "img/cars/benz/AMGHT4.png";
        name = "AMGHT 4";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "b2":
        honda1 =  "img/cars/benz/cabriolet.png";
        name = "Cabriolet";
        seat = "2";
        speed = "200KMPH";
        weight = "1250KG";
        capacity = "250KG";
        leater =  "20KM";
        color = "white";
        break;
      case "b3":
        honda1 = "img/cars/benz/coupe.png";
        name = "Coupe";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "b4":
        honda1 = "img/cars/benz/maybach.png";
        name = "MayBach";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "b5":
        honda1 = "img/cars/benz/sedan.png";
        name = "Sedan";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "b6":
        honda1 = "img/cars/benz/wagon.png";
        name = "Wagon";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "a1":
        honda1 = "img/cars/audi/A5Cabriolet.jpg";
        name = "A5 Cabriolet";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "a2":
        honda1 =  "img/cars/audi/A6allroad.jpg";
        name = "A6 Allroad";
        seat = "2";
        speed = "200KMPH";
        weight = "1250KG";
        capacity = "250KG";
        leater =  "20KM";
        color = "white";
        break;
      case "a3":
        honda1 = "img/cars/audi/rs3sedan.jpg";
        name = "RS3 Sedan";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "a4":
        honda1 = "img/cars/audi/s5coupe.jpg";
        name = "S5 Coupe";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "a5":
        honda1 = "img/cars/audi/TTCoupe.jpg";
        name = "TT Coupe";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "a6":
        honda1 = "img/cars/audi/TTRoadster.jpg";
        name = "TT Roadster";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "t1":
        honda1 = "img/cars/toyota/Avalon.jpg";
        name = "Avalon";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "t2":
        honda1 =  "img/cars/toyota/Camry.jpg";
        name = "Camry";
        seat = "2";
        speed = "200KMPH";
        weight = "1250KG";
        capacity = "250KG";
        leater =  "20KM";
        color = "white";
        break;
      case "t3":
        honda1 = "img/cars/toyota/CHR.jpg";
        name = "CHR";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "t4":
        honda1 = "img/cars/toyota/Corolla.jpg";
        name = "Corolla";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "t5":
        honda1 = "img/cars/toyota/Prius.jpg";
        name = "Prius";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "t6":
        honda1 = "img/cars/toyota/Yaris.jpg";
        name = "Yaris";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        break;
      case "v1":
        honda1 = "img/van/bongo.jpg";
        name = "Maxda Bongo";
        seat = "12";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "7";
        break;
      case "v2":
        honda1 =   "img/van/caravan.jpg";
        name = "Nissan Caravan";
        seat = "12";
        speed = "200KMPH";
        weight = "1250KG";
        capacity = "250KG";
        leater =  "20KM";
        color = "white";
        id = "8";
        break;
      case "v3":
        honda1 = "img/van/dolphin.jpg";
        name = "Toyota Dolphin";
        seat = "12";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "9";
        break;
      case "v4":
        honda1 =  "img/van/KDH.jpg";
        name = "Toyota KDH";
        seat = "12";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "10";
        break;
      case "v5":
        honda1 =  "img/van/toyotahiace.jpg";
        name = "Toyota Hiace";
        seat = "12";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "11";
        break;
      case "v6":
        honda1 = "img/van/Urvan.jpg";
        name = "Toyota Urvan";
        seat = "4";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "12";
        break;
      case "bike1":
        honda1 = "img/bike/cb350.jpg";
        name = "CB 350";
        seat = "2";
        speed = "250KMPH";
        weight = "200KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "13";
        break;
      case "bike2":
        honda1 =    "img/bike/chaly.jpg";
        name = "Chaly";
        seat = "2";
        speed = "200KMPH";
        weight = "250KG";
        capacity = "100CC";
        leater =  "20KM";
        color = "white";
        id = "14";
        break;
      case "bike3":
        honda1 = "img/bike/dio.jpg";
        name = "Honda Dio";
        seat = "2";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "15";
        break;
      case "bike4":
        honda1 =   "img/bike/rd350.jpg";
        name = "RD 350";
        seat = "2";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "16";
        break;
      case "bike5":
        honda1 =  "img/bike/gixxer.jpg";
        name = "Gixxer";
        seat = "2";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "17";
        break;
      case "bike6":
        honda1 = "img/bike/pulser220.jpg";
        name = "Pulser 220";
        seat = "2";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "18";
        break;
      case "cab1":
        honda1 = "img/cab/dmax.jpg";
        name = "D-max";
        seat = "2";
        speed = "250KMPH";
        weight = "200KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "19";
        break;
      case "cab2":
        honda1 =    "img/cab/f150reguler.jpg";
        name = "F150 Reguler";
        seat = "2";
        speed = "200KMPH";
        weight = "250KG";
        capacity = "100CC";
        leater =  "20KM";
        color = "white";
        id = "20";
        break;
      case "cab3":
        honda1 = "img/cab/Hilux.jpg";
        name = "Hilux";
        seat = "2";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "21";
        break;
      case "cab4":
        honda1 =   "img/cab/xenon.jpg";
        name = "Xenon";
        seat = "2";
        speed = "250KMPH";
        weight = "1000KG";
        capacity = "200KG";
        leater =  "15KM";
        color = "white";
        id = "22";
        break;

    }switch(widget.carid){
      case "v1":getdetails();break;
      case "v2":getdetails();break;
      case "v3":getdetails();break;
      case "v4":getdetails();break;
      case "v5":getdetails();break;
      case "v6":getdetails();break;
      case "bike1":getdetails();break;
      case "bike2":getdetails();break;
      case "bike3":getdetails();break;
      case "bike4":getdetails();break;
      case "bike5":getdetails();break;
      case "bike6":getdetails();break;
      case "cab1":getdetails();break;
      case "cab2":getdetails();break;
      case "cab3":getdetails();break;
      case "cab4":getdetails();break;

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(80),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue,

          ),

          padding: EdgeInsets.only(top: 20,bottom: 20),
          child: Container(

            margin: EdgeInsets.only(left: 20,right: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.backspace)),
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return AdminMainPage();
                      }));
                }, icon: Icon(Icons.home)),


              ],
            ),
          ),


        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 200,
            image: AssetImage(
                "img/boy.png"

            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                      honda1,

                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppLargeText(text: name),
            AppLargeText(text: honda0,color: honda0 =="Available"?Colors.green:Colors.red),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Seat",size: 15,),
                      AppLargeText(text: seat,size: 15,),
                    ],
                  ),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Maximum Speed",size: 15,),
                        AppLargeText(text: speed,size: 15,),
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Weight",size: 15,),
                        AppLargeText(text: weight,size: 15,),
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Load Capacity",size: 15,),
                        AppLargeText(text: capacity,size: 15,),
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Per Leater",size: 15,),
                        AppLargeText(text: leater,size: 15,),
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Color",size: 15,),
                        AppLargeText(text: color,size: 15,),
                      ],
                    ),),
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 10),
                    child: TextFormField(
                    controller: price,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: rentvalue,
                    ),
                    onSaved: (text){
                      rentprice = text;
                    },
                    validator: (text){
                      return validator.nameValidater(text!);
                    },
                  ),
                  ),


                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80,bottom: 20,right: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "Available",color: Colors.green,),
                      Radio(
                          value: '1',
                          groupValue: selectedradio,
                          onChanged: (value){
                            setState(() {
                              selectedradio=value;
                            });
                          }),

                    ],
                  ),
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "Not Available",color: Colors.red,),
                      Radio(
                          value: '0',
                          groupValue: selectedradio,
                          onChanged: (value){
                            setState(() {
                              selectedradio=value;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              width: double.infinity,
              height: 50,


              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: GestureDetector(

                      onTap: (){
                        setselectedradio();
                        setRentPrice();

                        },
                      child: AppText(text: "SET",color: Colors.white,),
                    ),

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class validator{
  static String? nameValidater(String text){
    if(text.isEmpty){
      return 'Name Cannot be empty';
    }else{
      return null;
    }
  }
}