
import 'package:alnawawiforty/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../botombar.dart';
import '../db/mydata.dart';
import '../model/hadithe.dart';
import '../utils/Strings.dart';

class AhadithScreen extends StatefulWidget {
  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {
  


  Widget ayah(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img.png"),
        SvgPicture.asset("assets/svg/grey.svg"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(key,style: const TextStyle(fontSize: 16,color: colorApp.yellow1),),
            // Text(name,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: colorApp.yellow1),textScaleFactor: .5,),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 3,
              child: Stack (
              children: [
                SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
                Column(
                  children: [
                    const SizedBox(height: 100,),
                    Container(
                      
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(""),
                        SvgPicture.asset("assets/svg/logo.svg"),
                        SvgPicture.asset("assets/svg/arrow-right.svg"),
                      ],
                    ),
                    ),
                    
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        TextApp.topHomeScreen,
                        // TextApp.headerHomeScreen,
      
                      ],
                    ),
                  ],
                ),
              ],
              ),
            ),
            Container(
              height: size.height * .7 ,
              child: Stack  (
                children: [
                  SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
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
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeHadith(hadith: item,)));
                                  },
                                  child: ayah(item.key, item.nameHadith)
                                  );
                            },
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisSpacing: 20,
                              childAspectRatio: 3/2,),
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
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
