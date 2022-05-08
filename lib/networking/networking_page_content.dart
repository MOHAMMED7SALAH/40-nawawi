
import 'package:alnawawiforty/model/hadithe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/Strings.dart';

class NetworkingPageContent extends StatefulWidget {
  
  final String data;


  const NetworkingPageContent({this.data,});

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(

          children: [
            Column(
              children: [
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(""),
                    SvgPicture.asset("assets/svg/logo.svg"),
                    SvgPicture.asset("assets/svg/arrow-right.svg"),
                  ],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    
                    TextApp.topHomeScreen,
                    // TextApp.headerHomeScreen,

                  ],
                ),
              ],
            ),
            _convertHadith(context, widget.data),
          ],
        ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", (e.substring(texts.first.length + 1))]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: const TextStyle(fontSize: 20, color: Colors.brown),
      //style: DefaultTextStyle.of(context).style,
      children: [TextSpan(text: split.first), ...hadiths
          .map((text) => text.contains("{")
              ? TextSpan(text: text, style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))
              : TextSpan(text: text))
          .toList()],
    ),
    textDirection: TextDirection.rtl,
  );
}
