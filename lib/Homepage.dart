import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Alex.dart';
import 'package:untitled2/Cairo.dart';
import 'package:untitled2/Porsaied.dart';
import 'package:untitled2/Tanta.dart';
import 'package:untitled2/logo.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,
              title: 'تحزير',
              desc: 'هل تريد الخروج من التطبيق',
              buttonsTextStyle: const TextStyle(color: Colors.black),
              showCloseIcon: true,
              btnCancelOnPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Homepage();
                }));
              },
              btnOkOnPress: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Logo();
                }));
              },
            ).show();
          },
          child: Icon(Icons.exit_to_app,color: Colors.white,),) ,

        title: Text("الصفحه الرئيسيه",style:TextStyle(color: Colors.white) ,),
        backgroundColor:Colors.orangeAccent
      ),

   body: Container(
     padding: EdgeInsets.all(20),
     child: ListView(children: [
     Card(child: Image.asset("images/OIP (1).jpg",height: 200,),),
     Container(height: 50,),
     Center(child: Container(child: Text("مرحبا بك ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
       Container(height: 20,),
       Container(
padding: EdgeInsets.all(20),
         color: Colors.orangeAccent,
           child:Text(" مركز الصيانه تحت امرك",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
      Container(height: 50,),

       MaterialButton(
         padding: EdgeInsets.all(10),
           shape: RoundedRectangleBorder(

           ),
           color: Colors.deepOrange,
           onPressed: ()async {
             Cairo();
             Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return Cairo();
             }));
           }
           ,child:Row(mainAxisAlignment: MainAxisAlignment.center,
         children: [ Icon(Icons.arrow_back_ios_new,color: Colors.white,),SizedBox(width: 10,),Text("اختر المركز الاقرب اليك",style: TextStyle(fontSize: 20,color: Colors.white),)],)

       ),

   ],),),

    ));
  }
}
