
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/widgets/app_text.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AppText(text: 'tiran Jayasekara'),
      ),

    );
  }
}
