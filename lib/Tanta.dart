import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'Place.dart';
class Tanta extends StatefulWidget {
  const Tanta({super.key});

  @override
  State<Tanta> createState() => _TantaState();
}

class _TantaState extends State<Tanta> {
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
                      Text("إيجي أوتو مركز الخدمة المعتمد في طنطا",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان :",style: TextStyle(color: Colors.white,fontSize: 20),),



                      Text(" طريق القاهره الاسكندريه الزراعي الكيلو 84 بعد كوبري دفره - طنطا",style: TextStyle(color: Colors.black,fontSize: 20)),


                      Text("رقم الهاتف :",style: TextStyle(color: Colors.white,fontSize: 20),),


                      Text("01000070023",style: TextStyle(color: Colors.black,fontSize: 20)),
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


                      Text((" الدلتا لصيانه السيارات"),style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white,fontSize: 20),),



                      Text("طريق القاهره اسكندريه الزراعي طنطا ",style: TextStyle(color: Colors.black,fontSize: 20)),


                      Text("رقم الهاتف ",style: TextStyle(color: Colors.white,fontSize: 20),),


                      Text("0403354964",style: TextStyle(color: Colors.black,fontSize: 20)),
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
                      Text(" حنتيره لقطع غيار السيارات",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text(" ابو حنيفه طنطا الغربيه",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("رقم الهاتف ",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text(" 01223542808",style: TextStyle(color: Colors.black,fontSize: 20)),
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
                      Text("دكتور نانو سيراميك",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("العنوان ",style: TextStyle(color: Colors.white),),
                      Text("مدرسه الزراعه طنطا الغربيه",style: TextStyle(color: Colors.black,fontSize: 20)),
                      Text("رقم الهاتف :",style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text("01032224880",style: TextStyle(color: Colors.black,fontSize: 20)),
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