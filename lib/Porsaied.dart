import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'Place.dart';
class Porsaied extends StatefulWidget {
  const Porsaied({super.key});

  @override
  State<Porsaied> createState() => _PorsaiedState();
}

class _PorsaiedState extends State<Porsaied> {
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
                      Text("Shamel Port Said Center",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان :",style: TextStyle(color: Colors.white,fontSize: 20),),



                      Text(" بور فؤاد، محافظة بورسعيد",style: TextStyle(color: Colors.black,fontSize: 20)),


                      Text("رقم الهاتف :",style: TextStyle(color: Colors.white,fontSize: 20),),


                      Text("01027035429",style: TextStyle(color: Colors.black,fontSize: 20)),
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
                      )


                    ],)),
            ),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text(("الالمانى لقطع غيار السيارات"),style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white,fontSize: 20),),



                      Text("في العبور بجوار بنك الاسكان ",style: TextStyle(color: Colors.black,fontSize: 20)),


                      Text("رقم الهاتف ",style: TextStyle(color: Colors.white,fontSize: 20),),


                      Text("01150275544",style: TextStyle(color: Colors.black,fontSize: 20)),
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
                      )


                    ],)),
            ),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("مؤسسة النصر لصيانة وتجارة قطع غيار السيارات",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text("  الكاب طريق القنطره، بور فؤاد، بور سعيد،, العرب",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("رقم الهاتف ",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text(" 01222981487",style: TextStyle(color: Colors.black,fontSize: 20)),
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
                      )
                    ],)),
            ),
            InkWell(
              onTap: (){

              },
              child: Card(
                color: Colors.deepOrange[200],
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Uni Center",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white),),
                      Text(" محمود صدقي باشا، قسم الشرق، محافظة بورسعيد ",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("رقم الهاتف :",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text("0225788055",style: TextStyle(color: Colors.black,fontSize: 20)),
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
                      )
                    ],)),
            ),
          ],),),
      ));
  }
}