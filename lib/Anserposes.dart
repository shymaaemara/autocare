
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Fixed.dart';
import 'package:untitled2/Showcost.dart';
class Anserposes extends StatefulWidget {
  const Anserposes({super.key});

  @override
  State<Anserposes> createState() => _AnserposesState();
}

class _AnserposesState extends State<Anserposes> {
  
  bool isloading=true;
  List data=[];


      getnamepostion()async{
                   QuerySnapshot querySnapshot   = await  FirebaseFirestore.instance.collection(
  "user2").orderBy("id1",descending: true).limit(1).get();
                   isloading=false;
                   setState(() {

                   });
        data.addAll(querySnapshot.docs) ;
        setState(() {

        });
      }
    

  @override
  void initState() {
    Future.delayed(Duration(seconds: 10)).then((value) =>

    getnamepostion());
   // getname();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent ,
          ),

          body:
isloading==true?Center(child: Text("جاري الرد ارجو الانتظار",style: TextStyle(fontSize: 20,color: Colors.black))):

          Container(
            padding: EdgeInsets.all(10),
           child:
                ListView.builder(
                    itemCount:data.length,
                    itemBuilder: (context,i){
                      return
                   Column(
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                   color: Colors.deepOrangeAccent
                   ),
                         
                         padding: EdgeInsets.all(20),
                         child: Column(

                           children: [
                                  Text("   لقد تم ارسال طلب العطل الي مركز ",style: TextStyle(fontSize: 20,color: Colors.black)),



                                    Text("${data[i]['namepostion']}",style: TextStyle(fontSize: 20,color: Colors.white),),
                             Container(height: 10,),
                             Text("  وللاستعلام عن الرد اضغط الزر الاتي ",style: TextStyle(fontSize: 20,color: Colors.black)),
                             Container(height: 10,),
                             MaterialButton(
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20)
                                 ),
                                 color: Colors.orangeAccent,
                                 onPressed: ()async {
                                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                     return Showcost();
                                   }));

                                 }
                                 ,child: Text("الرد",style: TextStyle(fontSize: 20,color: Colors.black),)),

                           ],
                         ),
                       ),
                       Container(
                         color: Colors.white,
                         height: 20,)

                     ],

                   );
                })











    ))  );
  }
}
