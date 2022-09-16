
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/pages/navpage/login.dart';
import 'package:http/http.dart' as http;

import '../../widgets/app_text.dart';
import 'home_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  var name1;
  var password1;
  var repassword1;
  var checkmailadd;



  final GlobalKey<FormState>formkey=GlobalKey<FormState>();

  Future checkmail(BuildContext cont)async{
      var url = 'http://localhost/flutter/checkmail.php';//"http://192.168.0.127/flutter/checkmail.php";
      var response = await http.post(url,body:{
        "email" : email.text,
      });
      var data = json.decode(response.body);
      validator();
      if(data == "success"){
        Fluttertoast.showToast(msg: "Your Email Already Registerd, Please Enter Another Email",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
        );
        checkmailadd = 1;
      }
      else{
        register(context);
      }
  }

  Future register(BuildContext cont)async{
    if(name.text == "" || password.text == "" || email.text == "" || nic.text == "" || location.text =="" || repassword == ""){

      validator();
    }else{
      if(password.text == repassword.text){

        var url = 'http://localhost/flutter/register.php';//"http://192.168.0.127/flutter/register.php";
        var response = await http.post(url,body:{
          "name" : name.text,
          "email" : email.text,
          "nic" : nic.text,
          "location" : location.text,
          "password" : password.text,
        });
        var data = json.decode(response.body);
        if(data == "success"){
          Fluttertoast.showToast(msg: "Register Successfull",toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16,
          );
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context){
                return Login();
              }));
        }
        else{
          Fluttertoast.showToast(msg: "The User And Password Is Not Match",toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16,
          );
        }
      }else{
        Fluttertoast.showToast(msg: "Password And Repassword Doesn't Match",toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
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
        child: SingleChildScrollView(
          child:Form(
            key: formkey,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10,left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: "Already Have Account",color: Colors.black45,size: 15,),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 1,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context){
                                return Login();
                              }));
                        }, icon: Icon(Icons.backspace_outlined)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: "REGISTER",size: 40,color: Colors.black,),
                    ],
                  ),
                ),//Register
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    child: buildname(),
                  ),//Name
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    child: Email(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    child: NIC(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    child: Location(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    child: Password(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    child: Repassword(),
                  ),
                  SizedBox(
                    height: 10,
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

                              if(formkey.currentState!.validate()){
                                formkey.currentState!.save();
                              }
                              checkmail(context);
                            },
                            child: AppText(text: "Register",color: Colors.white,),
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
    );
  }
  Widget buildname(){
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "UserName",
      ),
      onSaved: (text){
        name1 = text;
      },
      validator: (text){
        return validator.nameValidater(text!);
      },
    );
  }
  Widget Email(){
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText:"Email",
      ),
      autofillHints: [AutofillHints.email],
      onSaved: (text){
        name1 = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return 'Email Cannot be empty';
        }else if(checkmailadd == 1) {
          return 'Your Email Already registerd';
        }
        else{
          return null;
        }
      },
    );
  }

  Widget NIC(){
    return TextFormField(
      controller: nic,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "NIC",
      ),
      onSaved: (text){
        name1 = text;
      },
      validator: (text){
        return validator.nicValidater(text!);
      },
    );
  }
  Widget Location(){
    return TextFormField(
      controller: location,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Location",
      ),
      onSaved: (text){
        name1 = text;
      },
      validator: (text){
        return validator.LocationValidater(text!);
      },
    );
  }
  Widget Password(){
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Password",
      ),
      onSaved: (text){
        password1 = text;
      },
      validator: (text){
        return validator.passwordValidater(text!);
      },
    );
  }
  Widget Repassword(){
    return TextFormField(
      controller: repassword,
        obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Re Enter password",
      ),
      onSaved: (text){
        repassword1 = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return "Re Password Cann't be Empty";
        }else if(password.text != repassword.text){
          return "Password and RePassword Doesn't Match";
        }else{
          return null;
        }
        }
    );
  }
}

class validator{
var password;
var repassword;

  static String? nameValidater(String text){
    if(text.isEmpty){
      return 'Name Cannot be empty';
    }else{
      return null;
    }
  }
  static String? passwordValidater(String text){
    if(text.isEmpty){
      return 'Password Cannot be empty';
    }else{
      return null;
    }
  }


static String? nicValidater(String text){
  if(text.isEmpty){
    return 'NIC Cannot be empty';
  }else{
    return null;
  }
}
  static String? LocationValidater(String text){
  if(text.isEmpty){
    return 'Location Cannot be empty';
  }else{
    return null;
  }
}

}