import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Login2.dart';
class Showemail extends StatefulWidget {
  const Showemail({super.key});

  @override
  State<Showemail> createState() => _ShowemailState();
}

class _ShowemailState extends State<Showemail> {
  List data=[];
  getemail()async{
    QuerySnapshot querySnapshot =await   FirebaseFirestore.instance.collection("postion").get();
    data.addAll(querySnapshot.docs);
    setState(() {

    });
  }
  void initState() {
    getemail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(backgroundColor: Colors.orangeAccent,),
          body: Container(child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,i){


            return Column(children: [
              Container(height: 20,),
              Card(child: Row(children: [
                Text("اسم المركز:     ",style: TextStyle(fontSize: 20)),Text("${data[i]['namepostion']}",style: TextStyle(fontSize: 20))
              ],),),
              Container(height: 20,),
              Card(child: Row(children: [
                Text("الايميل: ",style: TextStyle(fontSize: 20),),SizedBox(width: 10,),Text("${data[i]['email']}",style: TextStyle(fontSize: 20))
                ],),),
                Container(height: 20,),
                Card(child: Row(children: [
                Text("كلمه المرور:",style: TextStyle(fontSize: 20)),SizedBox(width: 10,),Text("${data[i]['password']}")
                ],),),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.orangeAccent,
                  onPressed: ()async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){

                      return Login2();
                    }));

                  }
                  ,child: Text("تسجيل الدخول",style: TextStyle(fontSize: 20,color: Colors.white),)

              ),
            ],


            );
          }),),
        ));
  }
}
