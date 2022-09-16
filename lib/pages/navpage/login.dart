
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/foget/verify.dart';
import 'package:travel/pages/navpage/main_page.dart';
import 'package:travel/pages/navpage/preferances.dart';
import 'package:travel/pages/navpage/register.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


import '../../Admin/Admin_Login.dart';
import '../../foget/reset.dart';
import '../../userAccount/user.dart';
import 'home_page.dart';
import 'my_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var sendmail;
  final GlobalKey<FormState>formkey=GlobalKey<FormState>();
  final preferanceservice = preferance();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populate();
  }

  void populate()async{
    final setting = await preferanceservice.getSetting();
    setState(() {
      username.text = setting.email;
    });
  }

  Future login(BuildContext cont)async{
  if(username.text == "" || password.text == ""){
  /*Fluttertoast.showToast(msg: "Cann't Be Empty",toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  fontSize: 16,
  );*/
    /*validator();*/
  }else{
    var url = 'http://localhost/flutter/connect.php';//"http://192.168.0.127/flutter/connect.php";
    var response = await http.post(url,body:{
      "username" : username.text,
      "password" : password.text,
    });

    var data = json.decode(response.body);
    if(data == "success"){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(/*recivemail: sendmail*/),
      ));
    }
    else{
      Fluttertoast.showToast(msg: "The User And Password Is Not Match",toastLength: Toast.LENGTH_SHORT,
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
        child: Column(
          children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  width: double.infinity,
                  //color: Colors.white,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(text: "Haven't Account?",color: Colors.black45,),
                            IconButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context){
                                    return Register();
                                  }));
                            }, icon: Icon(Icons.navigate_next_outlined)),
                          ],
                        ),
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
                      AppText(text: "LOGIN",size: 40,color: Colors.black,),
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
                              margin: EdgeInsets.only(left: 40,right: 40,top: 80),
                              child: TextFormField(
                                controller: username,

                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Email",
                                ),
                                validator: (text){
                                  return validator.nameValidater(text!);
                                },
                                onSaved: (text){
                                  sendmail = text;
                                },
                                autofillHints: [AutofillHints.email],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40,right: 40,top: 30),
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Password",
                                ),
                                validator: (text){
                                  return validator.passwordValidater(text!);
                                },
                              ),
                            ),
                          ],
                        ),

                      ),

                    ),
                  ),
                ),

                Container(

                  margin: EdgeInsets.only(top: 80,left: 40,right: 40),
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
                            save();
                            login(context);

                            },
                          child: AppText(text: "Login",color: Colors.white,),
                        ),

                      ),

                    ],
                  ),
                ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(

                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return Verify();
                      }));
                },
                child: AppText(text: "Foget Password",color: Colors.black54,size: 20,),
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(

                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return Admin_Login();
                      }));
                },
                child: AppText(text: "Admin",color: Colors.black54,size: 20,),
              ),

            ),

          ],
        ),
      ),
    );
  }

  void save() {
    final newsetting = setting(email: username.text);
    print(newsetting);
    preferanceservice.saveSetting(newsetting);

  }
}
class validator{
  static String? nameValidater(String text){
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

class setting{
  final email;
  setting(
  {required this.email}
      );
}