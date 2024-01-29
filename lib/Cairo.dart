import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Place.dart';
class Cairo extends StatefulWidget {
  const Cairo({super.key});

  @override
  State<Cairo> createState() => _CairoState();
}

class _CairoState extends State<Cairo> {
  List data=[];
  getdata()async{
    
    QuerySnapshot querySnapshot= await  FirebaseFirestore.instance.collection("user1").get();
    data.addAll(querySnapshot.docs);
    setState(() {
      
    });
  }
  @override
  void initState() {
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(appBar: AppBar(
      backgroundColor: Colors.orangeAccent,
    ),
      body: Container(child: ListView.builder(
          itemCount:data.length ,
          itemBuilder: (context,i){
        return Card(
          color: Colors.deepOrangeAccent,
          child: Column(children: [
          Text("${data[i]['namepostion']}",style: TextStyle(fontSize: 20,color: Colors.white)),
          Text("${data[i]['place']}",style: TextStyle(fontSize: 20,color: Colors.white)),
          Text("${data[i]['phone']}",style: TextStyle(fontSize: 20,color: Colors.white)),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.orangeAccent,
            onPressed: ()async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return Place();
              }));

            }
            ,child: Text("عرض",style: TextStyle(fontSize: 20,color: Colors.white),))
        ],),);
      }),),
    
    ));
  }
}
