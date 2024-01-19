import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled2/Fixed.dart';
import 'package:untitled2/Homepage.dart';
import 'package:untitled2/Sighin.dart';
import 'package:untitled2/Sighin2.dart';


class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
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
                            if (val!.length<10){

                              return "not valid";
                            }},
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "الايميل",
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

                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }


                          }
                          else{
                            print("null");
                          };
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                            return Fixed();
                          }));
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

                            return Sighin2();
                          }));

                        }
                        ,child: Text("قم بتسجيل حساب من هنا",style: TextStyle(fontSize: 20,color: Colors.white),)

                    ),
                  ])))));






  }
}
