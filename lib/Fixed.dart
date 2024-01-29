import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Anser.dart';
import 'package:untitled2/Showcost.dart';
class Fixed extends StatefulWidget {

  const Fixed({super.key, });

  @override
  State<Fixed> createState() => _FixedState();
}

class _FixedState extends State<Fixed> {
  List data=[];


  getproblem()async{
    QuerySnapshot querysnapshot =await FirebaseFirestore.instance.collection('user3').orderBy("id",descending: true).limit(1).get();
              data.addAll(querysnapshot.docs);
              setState(() {

              });
  }
@override
  void initState() {

  getproblem();
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
          body:



     Container(
       padding: EdgeInsets.all(10),
       child: ListView.builder(
          itemCount:data.length ,
          itemBuilder:(context,i){

            return

              Column(children: [

Image.asset("images/auto-mechanic-case-study.jpg"),
                Container(height: 20,),
                Card(child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text(" اسم السائق",style: TextStyle(color: Colors.orange,fontSize: 20),),Text("         ${data[i]['namedriver']}     ")],)),
       Card(child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Text(" المكان",style: TextStyle(color: Colors.orange,fontSize: 20),),Text("         ${data[i]['place']}     ")],)),

                Card(

                    child:Wrap(


                      children: [ Text("   العطل ونوع السياره",style: TextStyle(color: Colors.orange,fontSize: 20),),Text("         ${data[i]['problem']}     ")],


                )),


     Container(height: 50,),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.orangeAccent,
                    onPressed: ()async {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                   return Anser();
                 }));
                    }
                    ,child: Text("ارسال الرد",style: TextStyle(fontSize: 20,color: Colors.white),)

                ),
              ],);
          } ),
     ),





        ));
  }
}
