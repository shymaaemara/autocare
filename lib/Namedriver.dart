import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Fixed.dart';
class Namedriver extends StatefulWidget {
  const Namedriver({super.key});

  @override
  State<Namedriver> createState() => _NamedriverState();
}

class _NamedriverState extends State<Namedriver> {
  List data=[];
  bool isloading=true;

  getname()async {

    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance.collection(
        "user3").orderBy("id",descending: true).limit(1).get();
    Future.delayed(Duration(minutes: 15));
    data.addAll(querySnapshot1.docs);

    isloading = false;
    setState(() {

    });
  }
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) =>
    getname());
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
      isloading==true?Center(child: CircularProgressIndicator(),):
      Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
        return InkWell(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return Fixed ();
            }));
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepOrangeAccent
                ),

                      padding: EdgeInsets.all(80),
                child: Column(
                  children: [
                    Text("التاريخ:"
                        "     ${data[i]['history']}",style: TextStyle(fontSize: 20,color: Colors.white),),
                    Container(height: 20,),

                    Center(
                      child: Text("لديك طلب  جديد"
                          "     ",style: TextStyle(fontSize: 20,color: Colors.yellow)
                    ),
                ) ],
                ),),
              Container(height: 20,)
            ],
          ),
        );
      }),) ,
    ));
  }
}
