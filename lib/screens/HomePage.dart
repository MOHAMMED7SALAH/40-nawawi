import 'package:alnawawiforty/utils/Strings.dart';
import 'package:alnawawiforty/utils/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AhadithScreen.dart';
import 'AudioAhadith.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/background.svg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SvgPicture.asset("assets/svg/logo.svg"),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(child: TextApp.topHomeScreen),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => AhadithScreen()));
                        },
                        child: myCard(
                            colorApp.green1,
                            colorApp.green2,
                            TextApp.bookOneScreen.data,
                            "assets/quran.png",
                            'assets/svg/one.svg')),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => AudioAhadithScreen()));
                        },
                        child: myCard(
                            colorApp.yellow1,
                            colorApp.red2,
                            "الاستماع للاحاديث",
                            "assets/play.png",
                            'assets/svg/twoo.svg')),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

Widget myCard(
  Color color1,
  color2,
  String text,
  path1,
  path2,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
    child: Container(
        height: 117,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [
                  color1,
                  color2,
                ],
                begin: AlignmentDirectional.topEnd,
                end: AlignmentDirectional.bottomStart)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(path1),
            AutoSizeText(
              text,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  color: colorApp.offWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              maxLines: 2,
            ),
            SvgPicture.asset(path2)
          ],
        )),
  );
}
