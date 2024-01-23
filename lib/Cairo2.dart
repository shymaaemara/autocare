import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Place.dart';
class Cairo2 extends StatefulWidget {
  const Cairo2({super.key});

  @override
  State<Cairo2> createState() => _Cairo2State();
}

class _Cairo2State extends State<Cairo2> {
  List data=[];
  getdata()async{

    QuerySnapshot querySnapshot= await  FirebaseFirestore.instance.collection("position").get();
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
              color: Colors.deepOrange,
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
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,

                        desc: 'هل تريد حذف المركز',
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: true,
                        btnCancelOnPress: () {

                        },
                        btnOkOnPress: () async{
                          await   FirebaseFirestore.instance.collection("position").doc(data[i].id).delete();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                            return Cairo2();
                          }));
                        },
                      ).show();

                    }
                    ,child: Text("حذف",style: TextStyle(fontSize: 20,color: Colors.white),))
              ],),);
          }),),

    ));
  }
}
