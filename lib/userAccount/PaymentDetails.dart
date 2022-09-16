
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/Admin/widgets/app_text.dart';
import 'package:travel/Admin/widgets/app_text_large.dart';
import 'package:travel/vehicle/cars/honda.dart';

import '../pages/navpage/main_page.dart';
import 'package:http/http.dart' as http;

class PaymentDetails extends StatefulWidget {
  var carid;
  var booking;
  var from;
  var to;
  var email;

  PaymentDetails({Key? key, this.carid, this.booking, this.from, this.to, this.email}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}



class _PaymentDetailsState extends State<PaymentDetails> {
  var advance;

  Future booking(BuildContext cont)async{
    var url = 'http://localhost/flutter/booking.php';//"http://192.168.0.127/flutter/register.php";
    var response = await http.post(url,body:{
      "card" : widget.carid,
      "email" : widget.email,
      "from" : widget.from,
      "to" : widget.to,
      "booking" : "0",
      "advance" : advance,
    });
    var data = json.decode(response.body);
    if(data == "success"){
      Fluttertoast.showToast(msg: "Booking Request Successfull",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return MainPage();
          }));
    }
    else{
      Fluttertoast.showToast(msg: "Booking Not Successful",toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
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
                        return Honda();
                      }));
                }, icon: Icon(Icons.backspace)),
                AppLargeText(text: "Payment"),
              ],
            ),
          ),


        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40,right: 40,top: 80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue
              ),
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                    child:
                    Text('Please pay Advance. Confirm your order 100%. If you do not pay in advance, Please note that your order success rate is 50%.',
                      textAlign: TextAlign.justify,style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 80),
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
                        advance = "1000";
                        booking(context);
                      },
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              advance = "1000";
                              booking(context);
                            }, icon: Icon(FontAwesomeIcons.googlePay),),
                            AppText(text: "Google Pay",color: Colors.white,)
                          ],
                             ),
                      ),
                    ),

                  ),

                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 20),
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
                        advance = "1000";
                        booking(context);

                      },
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              advance = "1000";
                              booking(context);
                            }, icon: Icon(FontAwesomeIcons.applePay),),
                            AppText(text: "Apple Pay",color: Colors.white,)
                          ],
                        ),
                      ),
                    ),

                  ),

                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 20),
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
                        advance = "1000";
                        booking(context);
                      },
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              advance = "1000";
                              booking(context);
                            }, icon: Icon(FontAwesomeIcons.creditCard),),
                            AppText(text: "Card Pay",color: Colors.white,)
                          ],
                        ),
                      ),
                    ),

                  ),

                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 20),
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
                        advance = "0";
                        booking(context);
                      },
                      child: AppText(text: "Without Paying",color: Colors.white,),
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

