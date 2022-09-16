
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/pages/navpage/login.dart';
import 'package:travel/widgets/app_text.dart';

class Responce_Button extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Responce_Button({Key? key, this.width, this.isResponsive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,

      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(

              child: GestureDetector(

                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return Login();
                      }));
                },
                child: AppText(text: "Lets Go",color: Colors.white,),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
