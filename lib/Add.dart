import 'package:flutter/material.dart';
import 'package:untitled2/Cairo.dart';
import 'package:untitled2/Poss.dart';
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
          backgroundColor: Colors.orangeAccent,
        ),
          body: Container(child: ListView(children: [
            Container(height: 30,),
            Image.asset("images/male-worker-uniform-vector-illustration-man-wearing-protective-helmet-flat-style-person-holding-clipboard-showing-thumbsup-214007655.webp"),

            Container(height: 50,),
            MaterialButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.deepOrange,
                onPressed: ()async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
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
                    return Cairo ();
                  }));
                }
                ,child:
              Text("عرض قائمه مراكز الصيانه  ",style: TextStyle(fontSize: 20,color: Colors.white),)

            ),
          ],),),
        ));
  }
}
