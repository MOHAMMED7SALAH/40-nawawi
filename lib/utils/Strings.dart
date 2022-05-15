
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

abstract class TextApp {
  
  

        static AutoSizeText splashScreen  = AutoSizeText (
    "ألاربعين النوويه",

  style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,fontSize: 36),
  
);


 static AutoSizeText topHomeScreen  = AutoSizeText (
      "الاحاديث الاربعين النوويه",
textDirection: TextDirection.rtl,
  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
  
);

static AutoSizeText bookOneScreen  = AutoSizeText (
    "الأحاديث الاربعين نووية مكتوبة",
textDirection: TextDirection.rtl,
  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
  
);

  
}



