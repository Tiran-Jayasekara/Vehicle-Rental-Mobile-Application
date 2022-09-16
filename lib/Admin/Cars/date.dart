
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:travel/vehicle/cars/honda.dart';

import '../../pages/navpage/main_page.dart';
import '../../pages/navpage/preferances.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_large.dart';
import 'carwely.dart';
import 'package:http/http.dart' as http;

class Date extends StatefulWidget {
  var carid;
  Date({Key? key, this.carid}) : super(key: key);


  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final preferanceservice = preferance();
  late DateTimeRange dateRange;
  late DateTime date;
  var first = '';
  var second = '';

  var useremail;

  Future booking(BuildContext cont)async{
        var url = 'http://localhost/flutter/booking.php';//"http://192.168.0.127/flutter/register.php";
        var response = await http.post(url,body:{
          "card" : widget.carid,
          "email" : useremail,
          "from" : first,
          "to" : second,
          "booking" : "0",
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


  void populate()async{
    final setting = await preferanceservice.getSetting();
    setState(() {
      useremail = setting.email;
    });
  }


  void from(){
    if(dateRange == null ){

    }else{
      first =  DateFormat('dd/MM/yyyy').format(dateRange.start);
      second =  DateFormat('dd/MM/yyyy').format(dateRange.end);
      print("car id is"+widget.carid);
      print(useremail);
      /*until();*/

    }
  }
  void from1(){
    if(date == null){
    }else{
      first = DateFormat('dd/MM/yyyy').format(date);
      second = "Only One Day";
      /*until();*/
    }
  }

  /*void until(){
    if(dateRange == ""){
      print(first);
    }else{
      print(first);
      print(second);
    }
  }*/
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
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context){
                        return Honda();
                      }));
                }, icon: Icon(Icons.backspace)),
                AppLargeText(text: "Select Date"),
              ],
            ),
          ),


        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 200,
            image: AssetImage(
                "img/boy.png"

            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 40),
             /* decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),*/
              width: double.infinity,
              height: 50,


              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: GestureDetector(

                      onTap: (){
                        pickdaterange(context);
                        populate();
                      },
                      child: AppText(text: "Select Date Range",color: Colors.black,),
                    ),

                  ),

                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 40),
              /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.,
              ),*/
              width: double.infinity,
              height: 50,


              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: GestureDetector(

                      onTap: (){
                        pickDate(context);
                        populate();
                      },
                      child: AppText(text: "Select One Day",color: Colors.black,),
                    ),

                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 60),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(

                children: [
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "From",color: Colors.black,),
                      AppText(text: "To",color: Colors.black,),
                    ],

              ),
                    margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              ),
                  Container(
                    margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: first,color: Colors.black,),
                        AppText(text: second,color: Colors.black,),
                      ],

                    ),
                  ),
                ],
              ),
            ),
            Container(

              margin: EdgeInsets.only(left: 40,right: 40,top: 60),
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
                        if(first == ""){
                          Fluttertoast.showToast(msg: "Please Select Date",toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 16,
                          );
                        }else{
                          booking(context);
                        }

                      },
                      child: AppText(text: "Confirm",color: Colors.white,),
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
Future pickdaterange(BuildContext context)async{
  final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24*2)),
  );
  final NewDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year -5),
      lastDate: DateTime(DateTime.now().year +5),
    initialDateRange:initialDateRange,
  );
  if(NewDateRange == null)return;
  setState(() => dateRange = NewDateRange);
  from();
}

  Future pickDate(BuildContext context)async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 3),
    );
    if (newDate == null)return;
    setState(()=> date = newDate);
    from1();
  }

}

class setting{
  final email;
  setting(
      {required this.email}
      );
}