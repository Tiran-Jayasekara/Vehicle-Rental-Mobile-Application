
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/app_text_large.dart';

class Firebasee extends StatelessWidget {
  const Firebasee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "firebase"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FirebaseFirestore.instance.collection('testing').add({'timestamp':Timestamp.fromDate(DateTime.now())});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
