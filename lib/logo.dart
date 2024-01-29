


import 'package:flutter/material.dart';
import 'package:untitled2/Add.dart';
import 'package:untitled2/Fixed.dart';
import 'package:untitled2/Homepage.dart';
import 'package:untitled2/Log'
    'in.dart';
import 'package:untitled2/Login2.dart';

import 'package:untitled2/Loginpos.dart';
import 'package:untitled2/Poss.dart';
import 'package:untitled2/Showemail.dart';
class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return
    Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(

          ),
          body: Container(
            padding: EdgeInsets.all(30),
            child:  ListView(



            children: [


              Image.asset("images/carsflat.png",height: 200,),
              Container(height: 10,),
              Center(child: Text("اهلا بيك في تطبيق",style: TextStyle(fontSize: 20),)),
              Center(child: Text("Auto care",style: TextStyle(fontSize: 30),)),

              Container(height: 20,),
            InkWell(
                onTap: (){
                  Navigator.of(context).push
                    (MaterialPageRoute(builder: (context){
                    return Login();
                  }));
                },
                child:
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.deepOrange,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,color: Colors.white,), SizedBox(width: 25,),Text("السائق",style: TextStyle(fontSize: 20,color:Colors.white),)],)),),
          Container(height: 10,),
          InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return  Login2();
                }));
              },
              child:
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: Colors.white),SizedBox(width: 10,),Text("مركز الصيانه",style: TextStyle(fontSize: 20,color:Colors.white),)],)),),
              Container(height: 10,),
          InkWell(
              onTap: (){

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return Loginpos();
                      }));
              },
              child:
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: Colors.white),SizedBox(width: 10,) ,Text("اداره النظام",style: TextStyle(fontSize: 20,color: Colors.white),)],)),),
          ],),),
        ));
  }
}
