import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'Place.dart';
class Alex extends StatefulWidget {
  const Alex({super.key});

  @override
  State<Alex> createState() => _AlexState();
}

class _AlexState extends State<Alex> {
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("مراكز الصيانه"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(

          child: ListView(children: [

            Container(height: 30,),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("مركز هشام تايرز للاطارات والبطاريات",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان :",style: TextStyle(color: Colors.white,fontSize: 20),),



                      Text(" 8 شارع عمر بن عبد العزيز جانبي في شارع شهاب الدين",style: TextStyle(color: Colors.black,fontSize: 20)),


                      Text("رقم الهاتف :",style: TextStyle(color: Colors.white,fontSize: 20),),


                      Text("0100 6021262",style: TextStyle(color: Colors.black,fontSize: 20)),
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
    titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    desc: 'ادخل موقعك لارسال فريق لمساعدتك',
    descTextStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold
    ),
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return Place();
    }));
    },
    ).show();

    },child: Text("ارسل طلبك   ",style: TextStyle(fontSize: 20,color: Colors.white),)
    ) ],)),
            ),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text(("مركز أمان لإصلاح الأعطال وصيانة السيارات"),style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white,fontSize: 20),),



                      Text("المركز والشركة توجد في شارع 45 على الطريق الدولي",style: TextStyle(color: Colors.black,fontSize: 20)),


                      Text("رقم الهاتف ",style: TextStyle(color: Colors.white,fontSize: 20),),


                      Text("0120 0670802 ",style: TextStyle(color: Colors.black,fontSize: 20)),
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
    titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    desc: 'ادخل موقعك لارسال فريق لمساعدتك',
    descTextStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold
    ),
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return Place();
    }));
    },
    ).show();


    },child: Text("ارسل طلبك   ",style: TextStyle(fontSize: 20,color: Colors.white),))   ],)),
            ),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("مركز صيانة سيارات ابو غالى اوتوموتيف",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text("يوجد المركز في المنطقة الصناعية الأولى في العبور.",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("رقم الهاتف ",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text(" 0120 8110111 ",style: TextStyle(color: Colors.black,fontSize: 20)),
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
    titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    desc: 'ادخل موقعك لارسال فريق لمساعدتك',
    descTextStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold
    ),
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return Place();
    }));
    },
    ).show();
    },child: Text("ارسل طلبك   ",style: TextStyle(fontSize: 20,color: Colors.white),))   ],)),
            ),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("مركز صيانة وإصلاح جميع أنواع السيارات",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white),),
                      Text("شارع بن كوزمين متفرع من شارع عمر بن ابي ربيعة متفرع من شارع الشهيد جلال الدسوقي،, الإسكندرية",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("رقم الهاتف :",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text("20 128 674 2600",style: TextStyle(color: Colors.black,fontSize: 20)),
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Place();
          }));

        },
      ).show();
    },
      child: Text("ارسل طلبك   ",style: TextStyle(fontSize: 20,color: Colors.white),)
    ) ],)),
            ),
          ],),),
      ));
  }
}
