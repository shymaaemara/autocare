import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Fixed.dart';
import 'package:untitled2/Login.dart';
import 'package:untitled2/Showcost.dart';
import 'package:untitled2/talabat.dart';
class Anser extends StatefulWidget {

  const Anser({super.key, });

  @override
  State<Anser> createState() => _AnserState();
}

class _AnserState extends State<Anser> {


 var cost,namepostion;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  CollectionReference  user2 = FirebaseFirestore.instance.collection("user2");
  addcost()async{
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();

     user2 .add({
                  "namepostion":namepostion,
                 "cost":cost,
                 "id1":FirebaseAuth.instance.currentUser?.uid,
               });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        title: '',
        desc: 'لقد تم ارسال التكلفه بنجاح',
        buttonsTextStyle: const TextStyle(color: Colors.black),
        showCloseIcon: true,

        btnOkOnPress: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return Talabat ();
          }));
        },
      ).show();
  }}
  @override
  void initState() {
    addcost();
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
            Image.asset("images/6180468.png"),
        Container(height: 20,),
        Form(
          autovalidateMode: AutovalidateMode.always,
          key: formstate,
          child: Column(
            children: [
              TextFormField(

                  onSaved: (val){
                    namepostion=val;
                  },
                  validator: (val){
                    if (val!.length<2){
                      return "not valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.monetization_on_outlined)
                      ,
                      hintText: "اسم المركز ",
                      hintStyle: TextStyle(fontSize: 20),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)))),
              Container(height: 20,),
              TextFormField(

                  onSaved: (val){
                    cost=val;
                  },
                  validator: (val){
                    if (val!.length<2){
                      return "not valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.monetization_on_outlined)
                      ,
                      hintText: "التكلفه ",
                      hintStyle: TextStyle(fontSize: 20),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)))),

            ],
          ),
        ),
        Container(height: 50,),
        MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.orangeAccent,
            onPressed: ()async {
           formstate.currentState!.validate() ?  addcost():
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                title: '',
                desc: 'ادخل التكلفه',
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: true,

                btnOkOnPress: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return Anser ();
                  }));
                },
              ).show();

            }
            ,child: Text("ارسال ",style: TextStyle(fontSize: 20,color: Colors.white),)

        )
      ],),),
    ));
  }
}
