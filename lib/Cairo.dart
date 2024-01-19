import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Place.dart';
class Cairo extends StatefulWidget {
  const Cairo({super.key});

  @override
  State<Cairo> createState() => _CairoState();
}

class _CairoState extends State<Cairo> {
  List data=[];
  getpostion()async{
                    QuerySnapshot querySnapshot    =await  FirebaseFirestore.instance.collection("postion").get();
                    data .addAll(querySnapshot.docs);
                    setState(() {
                      
                    });
  }
  @override
  void initState() {
    getpostion();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
    Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(
                 centerTitle: true,
            title: Text("مراكز الصيانه",style: TextStyle(color: Colors.white,fontSize: 20)),
            backgroundColor: Colors.orangeAccent,
          ),
          body: Container(child: GridView.builder(
              itemCount:  data.length,
              itemBuilder: (context,i){
            return InkWell(
              onTap: (){
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  headerAnimationLoop: false,
                  animType: AnimType.bottomSlide,

                  desc: 'هل تريد حذف المركز',
                  buttonsTextStyle: const TextStyle(color: Colors.black),
                  showCloseIcon: true,
                  btnCancelOnPress: () {

                  },
                  btnOkOnPress: () async{
                 await   FirebaseFirestore.instance.collection("postion").doc(data[i].id).delete();
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                   return Cairo();
                 }));
                  },
                ).show();
              },
              child: Card(
                color: Colors.deepOrange,
                child: Column(children: [
                Text("${data[i]['namepostion']}",style: (TextStyle(fontSize: 20,color: Colors.white)),),
                Text("${data[i]['place']}",style: (TextStyle(fontSize: 20,color: Colors.white))),
                Text("${data[i]['phone']}",style: (TextStyle(fontSize: 20,color: Colors.white))),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.orangeAccent,
                      onPressed: ()async {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          title: 'خدمه العملاء',
                          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          desc: 'ادخل موقعك لارسال فريق لمساعدتك',
                          descTextStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                          buttonsTextStyle: const TextStyle(color: Colors.black),
                          showCloseIcon: true,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                              return Place();
                            }));

                          },
                        ).show();
                      },
                      child: Text("ارسل طلبك   ",style: TextStyle(fontSize: 20,color: Colors.white),)
                  )

              ],),),
            );
          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisExtent: 200),),)
        ));
  }
}
