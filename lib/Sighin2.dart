import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Login.dart';
import 'package:untitled2/Login2.dart';
class Sighin2 extends StatefulWidget {
  const Sighin2({super.key});

  @override
  State<Sighin2> createState() => _Sigh2inState();
}

class _Sigh2inState extends State<Sighin2> {
  var username,phone,email,password;
  bool showpassword=false;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
        appBar: AppBar(),
        body: Container(

          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Image.asset("images/OIP.jpg"),
            Container(height: 20,),

            Form(
                key:  formstate,
                child:Column(children: [
                  TextFormField(
                    onSaved: (val){

                      username=val;
                    }
                    ,
                    validator: (val){
                      if (val!.length<4){
                        return "not valid";
                      }
                      return null;},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "اسم المستخدم",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),


                        )
                    ),
                  ),
                  Container(height: 20,),
                  TextFormField(onSaved: (val){

                    phone=val;
                  }
                    ,
                    validator: (val){
                      if (val!.length<4){
                        return "not valid";
                      }
                      return null;},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "رقم الهاتف",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),


                        )
                    ),),
                  Container(height: 20,),
                  TextFormField(onSaved: (val){

                    email=val;
                  }
                    ,
                    validator: (val){
                      if (val!.length<4){
                        return "not valid";
                      }
                      return null;},
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "الايميل",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),


                        )
                    ),),
                  Container(height: 20,),
                  TextFormField(
                    obscureText: !showpassword,
                    onSaved: (val){

                      password=val;
                    }
                    ,
                    validator: (val) {
                      if (val!.length < 4) {
                        return "not valid";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              showpassword?
                              Icons.visibility:
                              Icons.visibility_off
                          ), onPressed: () {
                          setState(() {
                            showpassword=!showpassword;
                          });
                        },
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "كلمه السر",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),


                        )
                    ),
                  ),
                ],)


            ),
            Container(height: 30,),
            MaterialButton(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.orangeAccent,
                onPressed: ()async {



                  if(formstate.currentState!.validate()){

                    formstate.currentState?.save();
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: password,

                      );
                      print(credential);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'success',
                        titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        desc: 'لقد تم تسجيل حسابك بنجاح',
                        descTextStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: true,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {

                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                            return Login();
                          }));
                        },
                      ).show();

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          title: 'تحزير',
                          desc: 'The password provided is too weak.',
                          buttonsTextStyle: const TextStyle(color: Colors.black),
                          showCloseIcon: true,
                          btnCancelOnPress: () {

                          },
                          btnOkOnPress: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return Sighin2();
                            }));
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
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return Sighin2();
                            }));
                          },
                        ).show();
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }

                  }else{
                    print("null");
                  }


                }
                ,child: Text("تسجيل حساب",style: TextStyle(fontSize: 25
                ,color: Colors.white),)

            ),
            Container(height: 30,),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.white,
                onPressed: ()async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                    return Login2();
                  }));

                }
                ,child: Text("عوده",style: TextStyle(fontSize: 25
                ,color: Colors.black),)

            ),
          ],),),
      ));
  }
}
