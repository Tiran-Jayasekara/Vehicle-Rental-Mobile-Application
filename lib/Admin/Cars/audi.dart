
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/Admin/Cars/carwely.dart';
import 'package:travel/Admin/adminhome.dart';
import 'package:travel/pages/navpage/home_page.dart';
import 'package:travel/pages/navpage/main_page.dart';

import 'package:http/http.dart' as http;

import '../../../widgets/app_text.dart';
import '../../../widgets/app_text_large.dart';

class Audi extends StatefulWidget {
  const Audi({Key? key}) : super(key: key);

  @override
  State<Audi> createState() => _AudiState();
}

class _AudiState extends State<Audi> {

  var opasity = 100;
  var honda1 = "";
  var honda2 = "";
  var honda3 = "";
  var honda4 = "";
  var honda5 = "";
  var honda6 = "";


  List productList = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }

  getdetails()async {
    var url = 'http://localhost/flutter/car.php';
    var res = await http.post(url,body: {
      "id": "5",
    });
    productList = json.decode(res.body);
    print(productList[0]['ve1']);
    print(productList[0]['ve2']);
    setState(() {
      setcar();
    });
    return productList;

  }

  void setcar(){
    if(productList[0]['ve1'] == "1"){
      honda1 = "Available";
    }else{
      honda1 = "Not Available";
    }
    if(productList[0]['ve2'] == "1"){
      honda2 = "Available";
    }else{
      honda2 = "Not Available";
    }
    if(productList[0]['ve3'] == "1"){
      honda3 = "Available";
    }else{
      honda3 = "Not Available";
    }
    if(productList[0]['ve4'] == "1"){
      honda4 = "Available";
    }else{
      honda4 = "Not Available";
    }
    if(productList[0]['ve5'] == "1"){
      honda5 = "Available";
    }else{
      honda5 = "Not Available";
    }
    if(productList[0]['ve6'] == "1"){
      honda6 = "Available";
    }else{
      honda6 = "Not Available";
    }
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
                        return AdminMainPage();
                      }));
                }, icon: Icon(Icons.backspace)),
                AppLargeText(text: "Audi Cars"),
              ],
            ),
          ),


        ),
      ),

      body:ListView(

        children: [
          Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 30),
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
                            "img/cars/audi/A5Cabriolet.jpg",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"a1"),
                        ));

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "A5 Carriolet",color: Colors.black),
                    SizedBox(height: 20,),
                    AppText(text: honda1,color: honda1 =="Available"?Colors.green:Colors.red),

                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 30),
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
                            "img/cars/audi/A6allroad.jpg",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"a2"),
                        ));


                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "A6 Allroad",color: Colors.black),
                    SizedBox(height: 20,),
                    AppText(text: honda2,color: honda2 =="Available"?Colors.green:Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 30),
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
                            "img/cars/audi/rs3sedan.jpg",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"a3"),
                        ));

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "RS3 Sedan",color: Colors.black),
                    SizedBox(height: 20,),
                    AppText(text: honda3,color: honda3 =="Available"?Colors.green:Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 30),
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
                            "img/cars/audi/s5coupe.jpg",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"a4"),
                        ));

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "S5 Coupe",color: Colors.black),
                    SizedBox(height: 20,),
                    AppText(text: honda4,color: honda4 =="Available"?Colors.green:Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 30),
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
                            "img/cars/audi/TTCoupe.jpg",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"a5"),
                        ));

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "TT Coupe",color: Colors.black),
                    SizedBox(height: 20,),
                    AppText(text: honda5,color: honda5 =="Available"?Colors.green:Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 30),
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
                            "img/cars/audi/TTRoadster.jpg",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"a6"),
                        ));


                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "TT Roadster",color: Colors.black),
                    SizedBox(height: 20,),
                    AppText(text: honda6,color: honda6 =="Available"?Colors.green:Colors.red),
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
