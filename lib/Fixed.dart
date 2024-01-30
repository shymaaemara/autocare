import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Anser.dart';
import 'package:untitled2/Showcost.dart';
class Fixed extends StatefulWidget {

  const Fixed({super.key, });

  @override
  State<Fixed> createState() => _FixedState();
}

class _FixedState extends State<Fixed> {
  List data = [];

  CollectionReference user = FirebaseFirestore.instance.collection('user3');


 getproblem()async {
   try {
     QuerySnapshot querysnapshot = await FirebaseFirestore.instance.collection(
         'user3').orderBy("id",descending:true ).limit(1).get();
     print("Number of documents: ${querysnapshot.docs.length}");

     setState(() {
       data.addAll(querysnapshot.docs);
     });
   } catch (e) {
     print("Error fetching data: $e");
   };
 }
@override
  void initState() {

  getproblem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
    Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
          ),
          body:



     Container(
       padding: EdgeInsets.all(10),
       child:ListView.builder(
           itemCount: data.length,
           itemBuilder: (context,i){
         return   
             Container(child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
               Image.asset("images/auto-mechanic-case-study.jpg",),
               Container(height: 30,),
               Container(

                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.all(10),
                     child: Row(
                     children: [
                       Text(" اسم السائق: ",style: TextStyle(fontSize: 20,color: Colors.orangeAccent),),
                       Text("${data[i]['namedriver']}",style: TextStyle(fontSize: 20,color: Colors.cyan)),
                     ],
                   ),),
                 Container(
                   padding: EdgeInsets.all(10),
                   child: Row(
                   children: [
                     Text(" المكان: ",style: TextStyle(fontSize: 20,color: Colors.orangeAccent),),
                     Text("${data[i]['place']}",style: TextStyle(fontSize: 20,color: Colors.cyan)),
                   ],
                 ),),
                 Container(
                   padding: EdgeInsets.all(10),
                   child: Row(
                   children: [
                     Text(" العطل: ",style: TextStyle(fontSize: 20,color: Colors.orangeAccent),),
                     Text("${data[i]['problem']}",style: TextStyle(fontSize: 20,color: Colors.cyan)),
                   ],
                 ),),
               ],),),
                 Container(height: 30,),
                 MaterialButton(
                   padding: EdgeInsets.symmetric(horizontal: 40),
                     color: Colors.orangeAccent,
                     onPressed: ()async {
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                         return Anser();
                       }));

                     }
                     ,child: Text("ارسال الرد",style: TextStyle(fontSize: 20,color: Colors.white),))
               
             ],),);
       })
     ),





        ));
  }
}
