import 'package:flutter/material.dart';
import 'package:untitled2/Namedriver.dart';
class Talabat extends StatefulWidget {
  const Talabat({super.key});

  @override
  State<Talabat> createState() => _TalabatState();
}

class _TalabatState extends State<Talabat> {
  @override
  Widget build(BuildContext context) {
    return
    Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(backgroundColor: Colors.orangeAccent,),
          body:Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              Image.asset("images/auto-mechanics-cars-checklists-203544981.webp"),
              Container(height:100 ,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Namedriver();
                  }));
                },
                child: Container(
                color: Colors.orangeAccent,
padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                    Text(" طلبات  السائقين",style: TextStyle(fontSize:30,color: Colors.white),textAlign: TextAlign.center,),
                  ],
                ),),)
            ],),
          )
          
        ));
  }
}
