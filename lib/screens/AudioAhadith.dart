
import 'package:alnawawiforty/screens/localAudio.dart';
import 'package:alnawawiforty/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../db/mydata.dart';
import '../model/hadithe.dart';
import '../utils/Strings.dart';

class AudioAhadithScreen extends StatefulWidget {


  @override
  State<AudioAhadithScreen> createState() => _AudioAhadithScreenState();
}

class _AudioAhadithScreenState extends State<AudioAhadithScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      body:  Column(
        children: [
          Expanded(child:Stack(
            children: [
              SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
              Column(
                children: [
 SizedBox(
                        height: size.height * .13 ,
                      ),                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(""),
                      // const Text(""),
                      SvgPicture.asset("assets/svg/logo.svg"),
                      const Text(""),
//                       IconButton(onPressed: (){
//                         Navigator.pop(context);
//                       }, icon: Icon(Icons.arrow_forward_ios_outlined
// )
//                       )      
                                    ],
                  ),
                  Column(
                    
                    children:  [
                      TextApp.topHomeScreen,
                     

                    ],
                  ),
                ],
              ),
            ],
          ),flex: 1,),
          Expanded(child:  Stack  (
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                    LocalAudio(  hadith: item,
                                        localAudioPath: 'audio/' + item.audioHadith
                                    )
                                 )
                                );
                              },
                              child: ayah(item.key, item.nameHadith));
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
          ),flex: 3,),
        ],
      ),



    );
  }
}
/*
 ListView.builder(
              // physics: BouncingScrollPhysics(),
              //Count all records

              itemCount: snapshot.data.length,
              //all the records that are in the Operation table are passed to an item Operation item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index) {
                Hadith item = snapshot.data[index];
                //delete one register for id
                return ayah(item.key, item.nameHadith);

              },
            );
 */
/*
Card(
                  margin: EdgeInsets.all(3.0),
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: ListTile(

                    title:
                    RichText(
                      textAlign: TextAlign.right,

                      text: TextSpan(
                          style:TextStyle(fontSize:20,color: Colors.teal),
                          children: [
                            TextSpan(text: item.key+': ' , style: TextStyle(color: Colors.brown)),
                            TextSpan(text: item.nameHadith ,style: TextStyle(color: Colors.deepOrange))]
                      ),
                      textDirection: TextDirection.rtl,
                    ),

                    subtitle: Text(item.textHadith.substring(0,120) +'...', textDirection: TextDirection.rtl,),
                    trailing:Icon(Icons.library_books,color: Colors.brown,) ,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                          //HadithPage(hadith: item,)
                          HomeHadith(hadith: item,)
                      ));
                    },
                  ),
                );
 */
