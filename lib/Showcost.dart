



import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Homepage.dart';
import 'package:untitled2/Place.dart';
class Showcost extends StatefulWidget {
  final docid;
  const Showcost({super.key, this.docid});

  @override
  State<Showcost> createState() => _ShowcostState();
}

class _ShowcostState extends State<Showcost> {
  List data=[];
    bool isloading=true;
    var response;


  getcost()async{
                             QuerySnapshot querySnapshot= await   FirebaseFirestore.instance.collection("user2").orderBy("id1",descending: true).limit(1).get();
                             data.addAll(querySnapshot.docs);
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
      body:

      Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,i){

          return Column(children: [
             Image.asset("images/auto-mechanics-cars-checklists-203544981.webp"),

            Container(height: 20,),
Container(height: 40,),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.blue[300],
            child: Text("المركز تحت امرك  لقد تم تحديد موقعك وحساب التكلفه",style: TextStyle(fontSize: 20,color: Colors.white),) ,),

         Container(height: 40,),
          Card(

            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("التكلفه:",style: TextStyle(fontSize: 30),),Text("${data[i]['cost']} ",style: TextStyle(fontSize: 30)),],),)
         ,
            Container(height: 20,),
           ]);}),
          ),
    ));
  }
}
