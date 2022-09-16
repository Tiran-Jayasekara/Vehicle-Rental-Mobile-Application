

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel/Admin/adminhome.dart';
import 'package:travel/Admin/widgets/app_text.dart';
import 'package:travel/Admin/widgets/app_text_large.dart';
import 'package:http/http.dart' as http;

class SearchUser extends StatefulWidget {
  const SearchUser({Key? key}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState>form=GlobalKey<FormState>();

  var name = "";
  var email1 = "";
  var NIC = "";
  var Location = "";
  var name2 = "";
  var email12 = "";
  var NIC2 = "";
  var Location2 = "";



  getcustomerdetails()async{
    var url = 'http://localhost/flutter/Admin/customerdetails.php';
    var res = await http.post(url,body: {
      "email": email.text,
    });
    var CustomerDetails = json.decode(res.body);
    if(CustomerDetails =="faild"){
      Fluttertoast.showToast(msg: "Not Registerd Customer",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
      setState(() {
        name = "";
        email1 = "";
        NIC = "";
        Location = "";
        name2 = "";
        email12 = "";
        NIC2 = "";
        Location2 = "";
      });


    }else{
      setState(() {
        name = CustomerDetails[0]['name'];
        email1 = CustomerDetails[0]['email'];
        NIC = CustomerDetails[0]['nic'];
        Location = CustomerDetails[0]['location'];
        name2 = "Name : ";
        email12 = "Email : ";
        NIC2 = "NIC : ";
        Location2 = "Location : ";
      });
      return CustomerDetails;
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
                AppLargeText(text: "Search Customer"),
              ],
            ),
          ),


        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 80,left: 20,right: 20),
          child: Column(
            children: [
              Form(
                key: form,
                  child:TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Customer Email",
                    ),
                    validator: (text){
                      return validator.nameValidater(text!);
                    },
                    autofillHints: [AutofillHints.email],
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
                          if(form.currentState!.validate()){
                            form.currentState!.save();
                          }
                          getcustomerdetails();

                        },
                        child: AppText(text: "Search",color: Colors.white,),
                      ),

                    ),

                  ],
                ),
              ),
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: name2,color: Colors.black),
                    SizedBox(height: 5,),
                    AppText(text: name),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: email12,color: Colors.black),
                    SizedBox(height: 5,),
                    AppText(text: email1),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: NIC2,color: Colors.black),
                    SizedBox(height: 5,),
                    AppText(text: NIC),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: Location2,color: Colors.black),
                    SizedBox(height: 5,),
                    AppText(text: Location),

                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
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
}