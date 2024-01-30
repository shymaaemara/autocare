import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Cairo.dart';
import 'package:untitled2/Cairo2.dart';
import 'package:untitled2/Poss.dart';

import 'logo.dart';
class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return
    Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(appBar: AppBar(
          leading: InkWell(
            onTap: (){
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                title: 'تحزير',
                desc: 'هل تريد الخروج من التطبيق',
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: true,
                btnCancelOnPress: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Poss();
                  }));
                },
                btnOkOnPress: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return Logo();
                  }));
                },
              ).show();
            },
            child: Icon(Icons.exit_to_app,color: Colors.white,),) ,
          backgroundColor: Colors.orangeAccent,

        ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: [
            Container(height: 30,),
            Image.asset("images/male-worker-uniform-vector-illustration-man-wearing-protective-helmet-flat-style-person-holding-clipboard-showing-thumbsup-214007655.webp"),

            Container(height: 100,),
            MaterialButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.deepOrange,
                onPressed: ()async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return Poss();
                  }));
                }
                ,child:Text("اضافه مراكز الصيانه",style: TextStyle(fontSize: 20,color: Colors.white)),

            ),
            Container(height: 30,),
            MaterialButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.orangeAccent,
                onPressed: ()async {

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Cairo2 ();
                  }));
                }
                ,child:
              Text("عرض قائمه مراكز الصيانه  ",style: TextStyle(fontSize: 20,color: Colors.white),)

            ),
          ],),),
        ));
  }
}
