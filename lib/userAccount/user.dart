
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/pages/navpage/home_page.dart';
import 'package:travel/pages/navpage/search.dart';
import 'package:travel/pages/welcomepage.dart';
import '../pages/navpage/main_page.dart';
import '../widgets/app_text.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  List recivemail;
  User({Key? key,required this.recivemail}) : super(key: key);


  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {



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
              ],
            ),
          ),


        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        opacity:10,
                        image: AssetImage(
                            "img/person.png"

                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "Name",color: Colors.black87,size: 25,),
                  AppText(text: widget.recivemail[0]['name'],color: Colors.black87,size: 15,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "Email",color: Colors.black87,size: 25,),
                  AppText(text:  widget.recivemail[0]['email'],color: Colors.black87,size: 15,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "NIC",color: Colors.black87,size: 25,),
                  AppText(text: widget.recivemail[0]['nic'],color: Colors.black87,size: 15,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "Location",color: Colors.black87,size: 25,),
                  AppText(text:widget.recivemail[0]['location'],color: Colors.black87,size: 15,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "Password",color: Colors.black87,size: 25,),
                  AppText(text: /*widget.recivemail[0]['password']*/"********",color: Colors.black87,size: 15,),
                ],
              ),
            ),
            Container(
            margin: EdgeInsets.only(top: 50),
            child: GestureDetector(

              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(recivemail:widget.recivemail),
                ));
              },
              child: AppText(text: "Edit Profile",color: Colors.black54,size: 20,),
            ),

          ),
            Container(

              margin: EdgeInsets.only(top: 80,left: 40,right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              width: double.infinity,
              height: 50,


              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: GestureDetector(

                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){
                              return welcomepage();
                            }));
                      },
                      child: AppText(text: "Log Out",color: Colors.white,),
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
