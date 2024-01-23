import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Fixed.dart';
class Namedriver extends StatefulWidget {
  const Namedriver({super.key});

  @override
  State<Namedriver> createState() => _NamedriverState();
}

class _NamedriverState extends State<Namedriver> {
  List data=[];
  bool isloading=true;
  getname()async {
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance.collection(
        "problems").limit(1).get();
    Future.delayed(Duration(seconds: 15));
    data.addAll(querySnapshot1.docs);

    isloading = false;
    setState(() {

    });
  }
  @override
  void initState() {
    getname();
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
        return InkWell(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return Fixed ();
            }));
          },
          child: Column(
            children: [
              Container(
                color: Colors.deepOrange,
                      padding: EdgeInsets.all(80),
                child: Column(
                  children: [
                    Text("التاريخ:"
                        "     ${data[i]['history']}",style: TextStyle(fontSize: 20,color: Colors.black),),

                    Text("اسم السائق:"
                        "     :${data[i]['namedriver']}",style: TextStyle(fontSize: 20,color: Colors.black),),
                  ],
                ),),
              Container(height: 20,)
            ],
          ),
        );
      }),) ,
    ));
  }
}
