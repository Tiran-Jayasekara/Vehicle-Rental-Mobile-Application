
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../pages/navpage/home_page.dart';
import '../pages/navpage/login.dart';
import '../widgets/app_text.dart';
import 'package:http/http.dart' as http;

class Reset extends StatelessWidget {
  var recivemail;
  Reset({Key? key, @required this.recivemail}) : super(key: key);

  var password;
  var repassword;


  final GlobalKey<FormState>formkey1=GlobalKey<FormState>();

  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();


  Future ResetPassword(BuildContext cont)async{
    if(pass.text == "" || repass.text == ""){
      Fluttertoast.showToast(msg: "Enter Password",toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      fontSize: 16,
      );
      /*validator();*/
    }else if(pass.text == repass.text){
      var url = "http://localhost/flutter/resetpassword.php"   /*"http://192.168.0.127/flutter/resetpassword.php"*/;
      var response = await http.post(url,body:{
        "email" : recivemail,
        "password" : pass.text,

      });
      var data = json.decode(response.body);
      if(data == "success"){
        Fluttertoast.showToast(msg: "Password Reset Successfull",toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
        pass.text = "";
        repass.text = "";

      }
      else{
        Fluttertoast.showToast(msg: "Password reset unsuccess",toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
    }
    else{
      Fluttertoast.showToast(msg: "The Password And RePassword Is Not Match",toastLength: Toast.LENGTH_SHORT,
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
                  AppText(text: "Reset Password",size: 40,color: Colors.black,),
                ],
              ),
            ),
            Container(
              child:SingleChildScrollView(
                child:Form(
                  key: formkey1,
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40,top: 80),
                          child: Password(),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40,right: 40,top: 20),
                          child: rePassword(),
                        ),
                        Container(

                          margin: EdgeInsets.only(top: 60,left: 40,right: 40),
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
                                      formkey1.currentState!.save();
                                    }
                                    print(recivemail);
                                    ResetPassword(context);

                                  },
                                  child: AppText(text: "Confirm",color: Colors.white,),
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(

                          margin: EdgeInsets.only(top: 60,left: 40,right: 40),
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
                                          return Login();
                                        }));
                                  },
                                  child: AppText(text: "Home Page",color: Colors.white,),
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
  Widget Password(){
    return TextFormField(
      controller: pass,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter New Password",
      ),
      validator: (text){
        if(text!.isEmpty){
          return 'Please Enter Password';
        }else if(text.length <6){
          return 'Please Enter password more than six Characters';
        }else{
          return null;
        }
      },
    );
  }
  Widget rePassword(){
    return TextFormField(
      controller: repass,
      //obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter Password Again",
      ),
      onSaved: (text){
        password = text;
      },
      validator: (text){
         if(text!.isEmpty){
           return 'Please Enter RePassword';
         }else if(pass.text != repass.text){
           return "Password And Re Password Doesn't Match";
         }else{
           return null;
         }
      },

    );
  }
}

