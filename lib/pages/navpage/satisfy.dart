
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/app_text_large.dart';

class Satisfy extends StatefulWidget {
  const Satisfy({Key? key}) : super(key: key);

  @override
  State<Satisfy> createState() => _SatisfyState();
}

class _SatisfyState extends State<Satisfy> {

  final carid = List<String>.generate(10000, (i) => "");
  final Message = List<String>.generate(10000, (i) => "");

  List notificationList = [];
  int notification_count = 0;

  final name = List<String>.generate(10000, (i) => "");
  final message = List<String>.generate(10000, (i) => "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Notification();
  }


  Notification()async {
    var url = 'http://localhost/flutter/feedbackview.php';
    var res = await http.post(url,body: {
    });
    if(json.decode(res.body) == "faild"){
      print("faild");
    }else{
      notificationList = json.decode(res.body);
      setState(() {
        countnotification();
      });
      return notificationList;
    }
  }

  countnotification() {
    for (var i = 0; i < notificationList.length; i++) {
      notification_count++;
      name[i] = notificationList[i]['name'];
      message[i] = notificationList[i]['feedback'];
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
            color: Colors.black12,
          ),

          padding: EdgeInsets.only(top: 40,bottom: 20),
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLargeText(text: "FeedBack"),
              ],
            ),
          ),


        ),
      ),
      body: ListView.builder(itemBuilder:(context,index){
            return Card(
              child: Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: AppLargeText(text:name[index],size: 20,color: Colors.black,),
                      ),

                      subtitle:Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          children: [
                            AppLargeText(text:message[index],size: 20,color: Colors.black38,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            );
          },
            itemCount: notification_count,
          )

    );
  }
}
