import 'package:flutter/material.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/app_text_large.dart';
import 'package:travel/widgets/responce_button.dart';

// ignore: camel_case_types
class welcomepage extends StatefulWidget {
  const welcomepage({Key? key}) : super(key: key);
  @override
  State<welcomepage> createState() => _welcomepageState();
}

// ignore: camel_case_types
class _welcomepageState extends State<welcomepage> {
  List images = [
    "back.jpg",
    "boy.png",
    "rent2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  /*color: Colors.black,*/
                  image: DecorationImage(
                      image: AssetImage(
                          "img/"+images[index]
                      ),
                    fit: BoxFit.cover,
                  )),
              child: Container(
                margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Premium Vehicle"),
                        AppText(text: "Enjoy the luxury",size: 26, color: Colors.black54,),
                        SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Hourly rental Experience the thrill at a lower price",
                            color:Colors.white70,
                            size: 30,

                          ),
                        ),
                        SizedBox(height: 50),
                        Responce_Button(width: 150),

                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexSlider){
                        return Container(
                          margin: EdgeInsets.only(bottom: 3),
                          width: 8,
                          height: index==indexSlider?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexSlider?Colors.black:Colors.black12,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
