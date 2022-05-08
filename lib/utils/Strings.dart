
import 'package:flutter/material.dart';

abstract class TextApp {
  static const Text splashScreen=Text("ألاربعين النوويه"
    ,style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,fontSize: 36),);

  static const Text topHomeScreen=Text("الاحاديث الاربعين النوويه",textDirection: TextDirection.rtl
    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),);
  // static const Text headerHomeScreen=Text("سماع الاحاديث النوويه"
  //   ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 30),);


  static const Text bookOneScreen=Text("الأحاديث الاربعين نووية مكتوبة", textDirection: TextDirection.rtl
    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),);
  static const Text bookTwoScreen=Text("الأستماع للأحاديث");
  // static const Text bookThreeScreen=const Text("ألأحاديث المحفوظه");
}