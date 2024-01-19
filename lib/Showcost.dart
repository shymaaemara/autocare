import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Place.dart';
class Showcost extends StatefulWidget {
  const Showcost({super.key});

  @override
  State<Showcost> createState() => _ShowcostState();
}

class _ShowcostState extends State<Showcost> {
  List data=[];
    bool isloading=true;
  getcost()async{

            QuerySnapshot querySnapshot1  = await FirebaseFirestore.instance.collection("costs").where("id",isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
            Future.delayed(Duration(seconds: 4));
           data.addAll(querySnapshot1.docs );

            isloading=false;
            setState(() {

            });
  }@override
  void initState() {
    getcost();
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
      body:isloading==true?Center(child: Container(child: CircularProgressIndicator(),)):

      Container(child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,i){
          return Column(children: [
             Image.asset("images/auto-mechanics-cars-checklists-203544981.webp"),
Container(height: 20,),
          Card(

            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("التكلفه:",style: TextStyle(fontSize: 20),),Text("${data[i]['cost']} ",style: TextStyle(fontSize: 20)),],),)
         ,

          ]);}),
          ),
    ));
  }
}
