import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:travel/pages/welcomepage.dart';
import 'package:travel/userAccount/PaymentDetails.dart';


void main()async{

  runApp(DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      //home:Admin_Login(),
      home:welcomepage(),
      //home:PaymentDetails(),


    );
  }
}

