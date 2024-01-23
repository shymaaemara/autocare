import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Add.dart';
import 'package:untitled2/Cairo.dart';
import 'package:untitled2/Cairo2.dart';
import 'package:untitled2/Homepage.dart';
import 'package:untitled2/Showemail.dart';
class Poss extends StatefulWidget {
  const Poss({super.key});

  @override
  State<Poss> createState() => _PossState();
}

class _PossState extends State<Poss> {
  var nameposition,place,phone,email,password;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  addposition()async{
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();
                    CollectionReference    pos   =  await FirebaseFirestore.instance.collection("position");
                    pos.add({
                      "namepostion":nameposition,
                      "place":place,
                      "phone":phone,
                      "email":email,
                      "password":password
                      ,"id1":FirebaseAuth.instance.currentUser?.uid
                    });

  }}
    greatemail()async{
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return Cairo2();
        }));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            headerAnimationLoop: false,
            animType: AnimType.bottomSlide,
            title: 'تحزير',
            desc: 'The password provided is too weak',
            buttonsTextStyle: const TextStyle(color: Colors.black),
            showCloseIcon: true,
            btnCancelOnPress: () {

            },
            btnOkOnPress: () {
              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return Poss();
              }));
              ;
            },
          ).show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            headerAnimationLoop: false,
            animType: AnimType.bottomSlide,
            title: 'تحزير',
            desc: 'The account already exists for that email.',
            buttonsTextStyle: const TextStyle(color: Colors.black),
            showCloseIcon: true,
            btnCancelOnPress: () {

            },
            btnOkOnPress: () {
              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return Poss();
              }));
              ;
            },
          ).show();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
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
        padding: EdgeInsets.all(10),
        child:
      ListView(
        children: [
          Image.asset("images/male-worker-uniform-vector-illustration-man-wearing-protective-helmet-flat-style-person-holding-clipboard-showing-thumbsup-214007655.webp"),
          Form(
            key: formstate,
            child: Column(
              children: [
                Container(height: 20,),
                TextFormField(
                  onSaved: (val){
                    nameposition=val;
                  }
                  ,
                  validator: (val){
                    if (val?.length=={""}){

                      return "not valid";
                    }},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.playlist_add_check_circle_sharp),
                      hintText: " اسم المركز  ",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
                Container(height: 20,)
                ,
                TextFormField(
                  onSaved: (val){
                    place=val;
                  }
                  ,
                  validator: (val){
                    if (val?.length=={""}){

                      return "not valid";
                    }},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.place),
                      hintText: " العنوان  ",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
                Container(height: 20,),
                TextFormField(
                  onSaved: (val){
                    phone=val;
                  }
                  ,
                  validator: (val){
                    if (val!.length<11){

                      return "not valid";
                    }},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: " الهاتف   ",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
                Container(height:20 ,),
                TextFormField(
                  onSaved: (val){
                    email=val;
                  }
                  ,
                  validator: (val){
                    if (val!.length<10){

                      return "not valid";
                    }},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: " الايميل  ",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
                Container(height:20 ,),
                TextFormField(
                  onSaved: (val){
                    password=val;
                  }
                  ,
                  validator: (val){
                    if (val!.length<4){

                      return "not valid";
                    }},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.place),
                      hintText: " كلمه المرور  ",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),


                      )
                  ),
                ),
              ],
            ),


          ),
          Container(height: 20,),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.orangeAccent,
              onPressed: ()async {
                greatemail();
            addposition();


              }
              ,child: Text("اضافه",style: TextStyle(fontSize: 20,color: Colors.white),)

          ),
        ],
      ),
        ),
    ));
  }
}
