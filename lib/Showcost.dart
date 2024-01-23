



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
  CollectionReference cost  =  FirebaseFirestore.instance.collection("costs");
  getcost()async{
  response =await cost.limit(1).get();

            Future.delayed(Duration(minutes: 15));
           data.addAll(response.docs );

            isloading=false;
            setState(() {

            });
  }@override
  void initState() {
    FirebaseAuth.instance.currentUser?.uid==null?Center(child:Text("جاري الرد") ,):
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
      body:response==null?Center(child:Text(" جاري الرد  ارجو الانتظار",style: TextStyle(fontSize: 20),))

      :

      Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,i){
          return Column(children: [
             Image.asset("images/auto-mechanics-cars-checklists-203544981.webp"),

            Container(height: 20,),
Container(height: 20,),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.blue[300],
            child: Text("المركز تحت امرك  لقد تم تحديد موقعك وحساب التكلفه",style: TextStyle(fontSize: 20,color: Colors.white),) ,),

         Container(height: 20,),
          Card(

            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("التكلفه:",style: TextStyle(fontSize: 20),),Text("${data[i]['cost']} ",style: TextStyle(fontSize: 20)),],),)
         ,
            Container(height: 20,),
          MaterialButton(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
          ),
          color: Colors.orangeAccent,
          onPressed: ()async {

            AwesomeDialog(
              context: context,
              dialogType: DialogType.question,
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,

              desc: 'هل توافق علي التكلفه',
              buttonsTextStyle: const TextStyle(color: Colors.black),
              showCloseIcon: true,
              btnCancelOnPress: () {

              },
              btnOkOnPress: () {
                Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                  return Homepage();
                }));
                ;
              },
            ).show();
          }
          ,child: Text("ارسال الرد",style: TextStyle(fontSize: 20,color: Colors.white),)

          ) ]);}),
          ),
    ));
  }
}
