/*


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class third extends StatefulWidget {

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  final GlobalKey<FormState>formkey=GlobalKey<FormState>();
  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController contact1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController repassword1 = TextEditingController();


  var name;
  var email;
  var contact;
  var password;
  var repassword;


  Widget buildname(){
    return TextFormField(
      controller: name1,
      decoration: InputDecoration(hintText: 'Name'),
      maxLength: 20,
      onSaved: (text){
        name = text;
      },
      validator: (text){
        return validator.nameValidater(text!);
      },
    );
  }

  Widget buildemail(){
    return TextFormField(
      controller: email1,
      decoration: InputDecoration(hintText: 'Email'),
      maxLength: 20,
      onChanged: (text){
        print(text);
      },
      onSaved: (text){
        email = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return 'Email Cannot be empty';
        }else{
          return null;
        }
      },
    );
  }

  Widget buildpcontact(){
    return TextFormField(
      controller: contact1,
      decoration: InputDecoration(hintText: 'Contact'),
      maxLength: 20,
      onSaved: (text){
        contact = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return 'Password Cannot be empty';
        }else{
          return null;
        }
      },
    );
  }
  Widget buildpassword(){
    return TextFormField(
      controller: password1,
      decoration: InputDecoration(hintText: 'Password'),
      maxLength: 20,
      onSaved: (text){
        password = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return 'Password Cannot be empty';
        }else{
          return null;
        }
      },
    );
  }
  Widget buildrepassword(){
    return TextFormField(
      controller: repassword1,
      decoration: InputDecoration(hintText: 'RePassword'),
      maxLength: 20,
      onSaved: (text){
        repassword = text;
      },
      validator: (text){
        if(text!.isEmpty){
          return 'Password Cannot be empty';
        }else{
          return null;
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("third"),
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: (){
            */
/*   Navigator.of(context).pushNamed('/sec')*//*
;
            Navigator.pop(context,second());
          },
        ),
        actions: [
          IconButton(
              onPressed: (){
                name1.text='';
                email1.text='';
                contact1.text='';
                password1.text='';
                repassword1.text='';
              },
              icon:Icon(Icons.close)),
          IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: (){
                */
/*Navigator.of(context).pushNamed('/sec');*//*

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return asynco();
                    }
                ));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child:Form(
          key: formkey,
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: buildname(),

                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: buildemail(),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: buildpcontact(),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: buildpassword(),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: buildrepassword(),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: RaisedButton(
                    child: Text('button'),
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        print(name);
                        print(email);
                        print(contact);
                        print(password);
                        print(repassword);
                      }
                    },
                  ),
                ),
              ],
            ),

          ),

        ),
      ),
    );
  }
}


class validator{
  static String? nameValidater(String text){
    if(text.isEmpty){
      return 'Name Cannot be empty';
    }else{
      return null;
    }
  }
}

*/
