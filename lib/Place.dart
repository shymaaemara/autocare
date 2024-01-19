import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Fixed.dart';
import 'package:untitled2/Showcost.dart';
class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  var place,problem, type;
  CollectionReference problems = FirebaseFirestore.instance.collection('problems');
  addproblem(){
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();

      problems.add({

      "place":place,
      "problem":problem,

      "id":FirebaseAuth.instance.currentUser?.uid,


    });};

  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(child:
          ListView(children: [
Image.asset("images/2112949053_TDU2GameConfigurator.thumb.png.a5627d7d8263fd5250eaf5bc2c027f2c (1).png")
         ,
            Container(height: 20,),
            Form(
             key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (val){
                      place=val;
                    }
                    ,
                    validator: (val){
                      if (val?.length==null){

                       return "not valid";
                      }},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.place),
                        hintText: " ادخل موقعك ",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),


                        )
                    ),
                  ),



            Container(height: 10,),
            TextFormField(
              onSaved: (val){
                problem=val;
              }
              ,
              validator: (val){
                if (val?.length==null){

                  return "not valid";
                }},
              decoration: InputDecoration(

                  hintText: " ادخل العطل ونوع السياره ",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),


                  )
              ),
            ),
                  Container(height: 10),



                ])),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.orangeAccent,
                onPressed: ()async {

    AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: 'خدمه العملاء',
    titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    desc: ' انتظر الرد',
    descTextStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold
    ),
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      addproblem();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return Showcost ();
      }));

    },
    ).show();


                }
                ,child: Text("ارسال",style: TextStyle(fontSize: 20,color: Colors.white),)

            ),


          ],)

        ,),

    ));
  }
}