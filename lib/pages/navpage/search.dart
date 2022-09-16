
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:travel/pages/navpage/main_page.dart';
import 'package:travel/userAccount/user.dart';

import '../../foget/reset.dart';
import '../../foget/verify.dart';
import '../../widgets/app_text.dart';
import 'login.dart';

class Search extends StatefulWidget {
  List recivemail;
  Search({Key? key, required this.recivemail}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  var name1;
  var nic1;
  var location1;
  var password1;
  var repassword1;


  final GlobalKey<FormState>formkey=GlobalKey<FormState>();

  Future register(BuildContext cont)async{
    if(name.text == ""){
      name1 = widget.recivemail[0]['name'];
    }else{
      name1 = name.text;
    }
    if(nic.text =="") {
      nic1 = widget.recivemail[0]['nic'];
    }else{
      nic1 = nic.text;
    }
    if(location.text ==""){
      location1 =  widget.recivemail[0]['location'];
    }else{
      location1 = location.text;
    }
        var url = 'http://localhost/flutter/userupdate.php';//"http://192.168.0.127/flutter/register.php";
        var response = await http.post(url,body:{
          "name" : name1,
          "email" : widget.recivemail[0]['email'],
          "nic" : nic1,
          "location" : location1,
          //"password" : password.text,
        });
        var data = json.decode(response.body);
        if(data == "success"){
          Fluttertoast.showToast(msg: "Save Successfull",toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16,
          );
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context){
                return MainPage();
              }));
        }
        else{
          Fluttertoast.showToast(msg: "Save Not Successfully",toastLength: Toast.LENGTH_LONG,
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
        child: SingleChildScrollView(
          child:Form(
            key: formkey,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
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
                                return User(recivemail: widget.recivemail);
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
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: "Edit Profile",size: 40,color: Colors.black,),
                      ],
                    ),
                  ),//Register
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40,top: 30),
                    child: buildname(),
                  ),//Name
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40,top: 10,),
                    child: NIC(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                    child: Location(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                    child: Password(),
                  ),
                  SizedBox(
                    height: 10,
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
                              register(context);
                            },
                            child: AppText(text: "Save",color: Colors.white,),
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
        hintText: "Name"+" "+":"+" "+widget.recivemail[0]['name'],
      ),
      onSaved: (text){
        name1 = text;
      },
    );
  }

  Widget NIC(){
    return TextFormField(
      controller: nic,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "NIC"+" "+":"+" "+widget.recivemail[0]['nic'],
      ),
      onSaved: (text){
        name1 = text;
      },
    );
  }
  Widget Location(){
    return TextFormField(
      controller: location,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Location"+" "+":"+" "+widget.recivemail[0]['location'],
      ),
      onSaved: (text){
        name1 = text;
      },
    );
  }
  Widget Password(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: GestureDetector(

        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Reset(recivemail:widget.recivemail[0]['email']),
          ));
        },
        child: AppText(text: "New Password",color: Colors.black54,size: 20,),
      ),

    );
  }
}

