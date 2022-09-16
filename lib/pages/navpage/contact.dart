
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../../widgets/app_text_large.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController name = TextEditingController();
  TextEditingController feedback = TextEditingController();
  final GlobalKey<FormState>formkey=GlobalKey<FormState>();

  var name1;
  var feedback1;

  Future sendfeedback(BuildContext cont)async{
    if(name.text == "" || feedback.text == ""){

    }else{
        var url = 'http://localhost/flutter/feedback.php';//"http://192.168.0.127/flutter/register.php";
        var response = await http.post(url,body:{
          "name" : name.text,
          "feedback" : feedback.text,

        });
        var data = json.decode(response.body);
        if(data == "success"){
          Fluttertoast.showToast(msg: "Send Your Feedback",toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16,
          );
        }
        else{
          Fluttertoast.showToast(msg: "Send Faild",toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16,
          );
        }

      }
    }
  void emptytext(){
    name.text = "";
    feedback.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(150),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black12,
          ),

          padding: EdgeInsets.only(top: 40,bottom: 20),
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLargeText(text: "Contact Us"),
              ],
            ),
          ),


        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            opacity: 150,
            image: AssetImage(
                "img/boy.png"

            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                 AppLargeText(text: "Tiran Jayasekara",size: 15,),
                  AppLargeText(text: "Eagel Rental privet Limited",size: 15,),
                  AppLargeText(text: "In Sri Lanka",size: 15,),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Number",color: Colors.black87,size: 15,),
                            AppText(text: "-"),
                            AppText(text: "0714055143",color: Colors.black87,size: 15,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Email",color: Colors.black87,size: 15,),
                            AppText(text: "-"),
                            AppText(text: "Tiran@gmail.com",color: Colors.black87,size: 15,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "WebSite",color: Colors.black87,size: 15,),
                            AppText(text: "-"),
                            AppText(text: "Eagelrent@sl.com",color: Colors.black87,size: 15,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Branch",color: Colors.black87,size: 15,),
                            AppText(text: "-"),
                            AppText(text: "Kandy",color: Colors.black87,size: 15,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top:10,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                             launch('tel://4567');
                           }, icon: Icon(Icons.call)),
                        IconButton(onPressed: (){
                          launch('sms://4567');
                        }, icon: Icon(Icons.whatsapp)),
                        IconButton(onPressed: (){
                          launchurl();
                        }, icon: Icon(FontAwesomeIcons.blog)),
                        IconButton(onPressed: (){
                          facebook();
                        },
                            icon: Icon(FontAwesomeIcons.facebook)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        AppLargeText(text: "Your Feedback",size: 15,),
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40,top: 20),
                          child: Name(),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                          child: Feedback(),
                        ),
                        Container(

                          margin: EdgeInsets.only(top: 20,left: 40,right: 40),
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

                                    if(formkey.currentState!.validate()){
                                      formkey.currentState!.save();
                                      sendfeedback(context);
                                      emptytext();
                                    }
                                  },
                                  child: AppText(text: "Send",color: Colors.white,),
                                ),

                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
  Widget Name(){
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter Your Name",
      ),
      onSaved: (text){
        name1 = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return "Plece Enter Your Name";
        }else{
          return null;
        }
      },
    );
  }
  Widget Feedback(){
    return TextFormField(
      controller: feedback,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter Your Feedback",
      ),
      onSaved: (text){
        feedback1 = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return "Plece Enter Your Feedback";
        }else{
          return null;
        }
      },
    );
  }
  launchurl()async{
    const url = "https://www.google.com/";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not launch the url";
    }
  }
  facebook()async{
    const url = "https://www.facebook.com/home.php";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not launch the url";
    }
  }
}

