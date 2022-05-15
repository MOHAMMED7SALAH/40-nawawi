import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:alnawawiforty/utils/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

Widget ayah(String key, name) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/img.png"),
          SvgPicture.asset("assets/svg/grey.svg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               AutoSizeText(
  key,
  style: TextStyle(fontSize: 16, color: colorApp.yellow1),
  maxLines: 2,
),
            ],
          )
        ],
      );
    }