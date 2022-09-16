
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/pages/navpage/home_page.dart';
import 'package:travel/pages/navpage/main_page.dart';
import 'package:travel/vehicle/cars/carwely.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/app_text.dart';
import '../../../widgets/app_text_large.dart';

class Benz extends StatefulWidget {
  const Benz({Key? key}) : super(key: key);

  @override
  State<Benz> createState() => _BenzState();
}

class _BenzState extends State<Benz> {


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
      "id": "4",
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
                        return MainPage();
                      }));
                }, icon: Icon(Icons.backspace)),
                AppLargeText(text: "Benz Cars"),
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
                  width: 170,
                  height: 100,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(

                          image: AssetImage(
                            "img/cars/benz/AMGHT4.png",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(honda1 == "Available"){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"b1"),
                        ));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Not Available, Please Select another Vehicle",toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16,
                        );
                      }

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "Benz AMGHT 4",color: Colors.black),
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
                  width: 170,
                  height: 100,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "img/cars/benz/cabriolet.png",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(honda2 == "Available"){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"b2"),
                        ));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Not Available, Please Select another Vehicle",toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16,
                        );
                      }

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "cabriolet",color: Colors.black),
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
                  width: 170,
                  height: 100,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "img/cars/benz/coupe.png",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(honda3 == "Available"){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"b3"),
                        ));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Not Available, Please Select another Vehicle",toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16,
                        );
                      }

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "Benz Coupe",color: Colors.black),
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
                  width: 170,
                  height: 100,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "img/cars/benz/maybach.png",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(honda4 == "Available"){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"b4"),
                        ));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Not Available, Please Select another Vehicle",toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16,
                        );
                      }

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "MayBach",color: Colors.black),
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
                  width: 170,
                  height: 100,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "img/cars/benz/sedan.png",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(honda5 == "Available"){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"b5"),
                        ));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Not Available, Please Select another Vehicle",toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16,
                        );
                      }

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "Sedan",color: Colors.black),
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
                  width: 170,
                  height: 100,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "img/cars/benz/wagon.png",

                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: (){
                      if(honda6 == "Available"){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Carwely(carid:"b6"),
                        ));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Not Available, Please Select another Vehicle",toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16,
                        );
                      }

                    },
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(text: "Wagon",color: Colors.black),
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

