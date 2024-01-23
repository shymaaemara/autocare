
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
 

    CollectionReference col =  FirebaseFirestore.instance.collection(
        "position");

    

  @override
  void initState() {

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

          body:Container(
            padding: EdgeInsets.all(10),
            child: StreamBuilder(stream: col.snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Text("error");
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: Container(
                  padding: EdgeInsets.all(100),
                  color: Colors.orangeAccent,
                    
                    child: Text("جاري الرد",style: TextStyle(fontSize: 30),)));
              }
            
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount:1 ,
                    itemBuilder: (context,i){
                      return
                   Container(
                     color: Colors.deepOrange,
                     padding: EdgeInsets.all(100),
                     child: Column(

                       children: [
                              Text(" مركز الصيانه ",style: TextStyle(fontSize: 30,color: Colors.black)),

               Container(height: 20,),

                                Text("${snapshot.data?.docs[i]['namepostion']}",style: TextStyle(fontSize: 20,color: Colors.white),),
                         Container(height: 20,),
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
                             ,child: Text("الرد",style: TextStyle(fontSize: 20,color: Colors.black),))
            
                       ],
                     ),
                   );
                });
              }
              return Text("loading");
            }
            
            ),
          )
              
              
              
              

        ));
  }
}
