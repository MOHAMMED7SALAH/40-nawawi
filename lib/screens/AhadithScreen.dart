import 'package:alnawawiforty/utils/Strings.dart';
import 'package:alnawawiforty/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/botombar.dart';
import '../db/mydata.dart';
import '../model/hadithe.dart';

class AhadithScreen extends StatefulWidget {
  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 3,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/svg/background.svg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                       SizedBox(
                        height: size.height * .13 ,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(""),
                            SvgPicture.asset("assets/svg/logo.svg"),
                            const Text(""),
                        ],
                        ),
                      ),
                      Column(
                        
                        children:  [
                          TextApp.topHomeScreen,
                          
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * .7,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/svg/background.svg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  FutureBuilder(

                      //we call the method, which is in the folder db file database.dart
                      future: Mydata.getAlldata(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              Hadith item = snapshot.data[index];
                              //delete one register for id
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => HomeHadith(
                                                  hadith: item,
                                                )));
                                  },
                                  child: ayah(item.key, item.nameHadith));
                            },
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisSpacing: 20,
                              childAspectRatio: 3 / 2,
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
