import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Fixed.dart';
import 'package:untitled2/Login.dart';
import 'package:untitled2/Showcost.dart';
class Anser extends StatefulWidget {
  const Anser({super.key});

  @override
  State<Anser> createState() => _AnserState();
}

class _AnserState extends State<Anser> {

  var cost;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  CollectionReference costs = FirebaseFirestore.instance.collection('costs');
  addcost()async{
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();

               costs.add({
                 "cost":cost,
                 "id":FirebaseAuth.instance.currentUser?.uid
               });
  }}
  @override
  void initState() {

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
      body: Container(child: ListView(children: [
            Image.asset("images/6180468.png"),
        Container(height: 20,),
        Form(
          key: formstate,
          child: TextFormField(

              onSaved: (val){
                cost=val;
              },
              validator: (val){
                if (val!.length==null){
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
        ),
        Container(height: 50,),
        MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.orangeAccent,
            onPressed: ()async {
              addcost();
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
                    return Login ();
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
