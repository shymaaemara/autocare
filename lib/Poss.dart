import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Cairo.dart';
class Poss extends StatefulWidget {
  const Poss({super.key});

  @override
  State<Poss> createState() => _PossState();
}

class _PossState extends State<Poss> {
  var nameposition,place,phone;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  addposition()async{
    if(formstate.currentState!.validate()){

      formstate.currentState?.save();
                    CollectionReference    pos   =  await FirebaseFirestore.instance.collection("postion");
                    pos.add({
                      "namepostion":nameposition,
                      "place":place,
                      "phone":phone
                    });
  }}
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
                    if (val!.length=={""}){

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
                    if (val!.length=={""}){

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
                    if (val!.length=={""}){

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
            addposition();
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Cairo();
            }));
              }
              ,child: Text("ادخال",style: TextStyle(fontSize: 20,color: Colors.white),)

          ),
        ],
      ),
        ),
    ));
  }
}
