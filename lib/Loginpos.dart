import 'package:flutter/material.dart';
import 'package:untitled2/Add.dart';
import 'package:untitled2/Cairo2.dart';
import 'package:untitled2/Poss.dart';

import 'Cairo.dart';
class Loginpos extends StatefulWidget {
  const Loginpos({super.key});

  @override
  State<Loginpos> createState() => _LoginposState();
}

class _LoginposState extends State<Loginpos> {
  @override
  Widget build(BuildContext context) {
    return
    Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(appBar: AppBar(backgroundColor: Colors.orangeAccent,),
        body:

        Container(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Image.asset("images/male-worker-uniform-vector-illustration-man-wearing-protective-helmet-flat-style-person-holding-clipboard-showing-thumbsup-214007655.webp"),
            Container(height: 100,),
          TextFormField(

            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "admin@yahoo.com",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),


                )
            ),
          ),
          Container(height: 20,),
          TextFormField(

            decoration: InputDecoration(
                suffixIcon:  Icon(Icons.remove_red_eye_outlined),
                prefixIcon: Icon(Icons.lock),
                hintText: "1234567890",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),


                )
            ),
          ),
            Container(height: 20,),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.orangeAccent,
                onPressed: ()async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Add();
                  }));

                }
                ,child: Text("تسجيل الدخول",style: TextStyle(fontSize: 20,color: Colors.white),)

            ),
        ],),),
        ));
  }
}
