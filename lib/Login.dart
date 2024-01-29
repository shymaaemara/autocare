import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled2/Homepage.dart';
import 'package:untitled2/Sighin.dart';

import 'logo.dart';


class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var password,email;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();

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
          child: Center(
            child: ListView(children: [Form(
autovalidateMode: AutovalidateMode.always,
                key: formstate,
                child:
                Column(

                children: [

             Container(
                decoration:BoxDecoration(

                ) , 
                 child: Image.asset("images/320473119616.jpg",height: 200,width:380,fit: BoxFit.fill,)),
                  Container(height: 50,),
                TextFormField(
                onSaved: (val){
                email=val;
                }
                ,
                validator: (val){
                if (val!.length<12){

                return "not valid";
                }
                return null;},
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                hintText: "الايميل ",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),


                )
                ),
                ),
                Container(height: 20,),


                TextFormField(
                obscureText: true,
                onSaved: (val){
                password=val;
                },
                validator: (val){
                if (val!.length<5){
                return "not valid";
                }
                return null;
                },
                decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              prefixIcon: Icon(Icons.lock)
                    ,
                hintText: "كلمه المرور ",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50)))),

                  ],),),


                       Container(height: 50,),


              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.orangeAccent,
                  onPressed: ()async {
                    if(formstate.currentState!.validate()){

                      formstate.currentState?.save();
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return Homepage();
                        }));

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            headerAnimationLoop: false,
                            animType: AnimType.bottomSlide,
                            title: 'تحزير',
                            desc: 'No user found for that email.',
                            buttonsTextStyle: const TextStyle(color: Colors.black),
                            showCloseIcon: true,
                            btnCancelOnPress: () {

                            },
                            btnOkOnPress: () {
                             Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                return Login();
                              }));
                             ;
                            },
                          ).show();
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            headerAnimationLoop: false,
                            animType: AnimType.bottomSlide,
                            title: 'تحزير',
                            desc: 'Wrong password provided for that user.',
                            buttonsTextStyle: const TextStyle(color: Colors.black),
                            showCloseIcon: true,
                            btnCancelOnPress: () {

                            },
                            btnOkOnPress: () {
                              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                return Login();
                              }));
                            }

                          ).show();

                          print('Wrong password provided for that user.');
                        }
                      }


                    }
                    else{
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'تحزير',
                        desc: ' ب        لا يمكن ان يكون الايميل فارغ او غير صالح    ',
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: true,
                        btnCancelOnPress: () {

                        },
                        btnOkOnPress: () {
                          Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                            return Login();
                          }));
                          ;
                        },
                      ).show();
                    };

                  }
                  ,child: Text("تسجيل الدخول    ",style: TextStyle(fontSize: 20,color: Colors.white),)

          ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.orangeAccent,
                  onPressed: ()async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

          return Sighin();
        }));

                  }
                  ,child: Text("قم بتسجيل حساب من هنا",style: TextStyle(fontSize: 20,color: Colors.white),)

              ),
              Container(height: 20,),
             ])))));






  }
}
