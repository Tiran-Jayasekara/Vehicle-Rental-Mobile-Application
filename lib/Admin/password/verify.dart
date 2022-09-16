
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/Admin/password/reset.dart';
import 'package:travel/pages/navpage/login.dart';
import 'package:http/http.dart' as http;
import 'package:email_auth/email_auth.dart';




import '../widgets/app_text.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  var sendemail;

  final GlobalKey<FormState>formkey=GlobalKey<FormState>();
  final GlobalKey<FormState>formkey1=GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController verify = TextEditingController();


  Future emailconfig(BuildContext cont)async{
    if(email.text == ""){
      Fluttertoast.showToast(msg: "Please Enter Your Email",toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  fontSize: 16,
  );
      /*validator();*/
    }else{
      var url =  "http://localhost/flutter/Admin/reset.php"/*"http://192.168.0.127/flutter/reset.php"*/;
      var response = await http.post(url,body:{
        "email" : email.text,
      });
      var data = json.decode(response.body);
      if(data == "success"){
        sendOTP();
      }
      else{
        Fluttertoast.showToast(msg: "You Are Not Admin",toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
    }
  }

  void sendOTP()async{
    EmailAuth.sessionName = 'Test';
    var res = await EmailAuth.sendOtp(receiverMail:email.value.text);
    if(res){
      print("OTP send");
      Fluttertoast.showToast(msg: "OTP Send to Your Email",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }else{
      print("OTP not sent");
      Fluttertoast.showToast(msg: "OTP Not Sent",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
  }
  void verifyOTP(){
    var res = EmailAuth.validate(receiverMail: email.value.text, userOTP: verify.text);
    if(res){
      print("OTP verified");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Reset(recivemail: sendemail,),
          ));
    }else{
      print("OTP not Verified");
      Fluttertoast.showToast(msg: "OTP Not Verified",toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
                "img/boy.png"

            ),
            fit: BoxFit.cover,
          ),
        ),


        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,left: 20),
              width: double.infinity,
              //color: Colors.white,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                        child:IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context){
                                return Login();
                              }));
                        }, icon: Icon(Icons.backspace_outlined)),


                  ),

                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: "Verify Your Email",size: 40,color: Colors.black,),
                ],
              ),
            ),
            Container(
              child:SingleChildScrollView(
                child:Form(
                  key: formkey,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40,top: 20),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your Email",
                            ),
                            validator: (text){
                              return validator.emailValidater(text!);
                            },
                            onSaved: (text){
                              sendemail = text;
                            },
                          ),
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
                                      //formkey.currentState!.save();
                                    }
                                    emailconfig(context);
                                  },
                                  child: AppText(text: "Send Email",color: Colors.white,),
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
            Container(
              child:SingleChildScrollView(
                child:Form(
                  key: formkey1,
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40,top: 30),
                          child: TextFormField(
                            controller: verify,
                            //obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Verify Key",
                            ),
                            validator: (text){
                              return validator.passwordValidater(text!);
                            },
                          ),
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
                                    if(formkey1.currentState!.validate()){
                                      formkey.currentState!.save();
                                    }
                                    verifyOTP();
                                  },
                                  child: AppText(text: "Verify",color: Colors.white,),
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

 /* void showSnackBar(String text){
    final snackBar = SnackBar(
        content: Text(
          text,style: TextStyle(fontSize: 20),
        ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }*/
}




class validator{
  static String? emailValidater(String text){
    if(text.isEmpty){
      return 'Please Enter The Email';
    }else{
      return null;
    }
  }
  static String? passwordValidater(String text){
    if(text.isEmpty){
      return 'Please Enter The Password';
    }else{
      return null;
    }
  }
}