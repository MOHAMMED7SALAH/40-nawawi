import 'package:alnawawiforty/utils/colors.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/hadithe.dart';

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;
  const LocalAudio({this.localAudioPath, this.hadith});

  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = const Duration();
  Duration _position = const Duration();

  static final AudioPlayer  advancedPlayer = AudioPlayer();
  final AudioCache  audioCache = AudioCache(fixedPlayer: advancedPlayer);

  @override
  void initState() {
    super.initState();
    initPlayer();
  }
  @override

  void initPlayer() {
    advancedPlayer.durationHandler = (d) => setState(() {
      onError: (Exception exception) =>
          print('_loadFile => exception $exception');
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(Icons.add_shopping_cart,color:Colors.cyan,size: 250),

        slider(),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: children
                .map((w) => Container(child: w, padding: const EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  //// test
  VoidCallback onPressedplypus(){
    bool bol=true;
    if(bol){
      audioCache.play("path");
      _btn(const Icon(Icons.play_arrow), () => advancedPlayer.pause());
    }else{
      bol=false;
      advancedPlayer.pause();
      _btn(const Icon(Icons.pause), () => advancedPlayer.pause());
    }

  }
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 50.0,
      child: SizedBox(
        width: 70,
        height: 50,
        child: RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: icon,
            color: Colors.black45,
            textColor: colorApp.yellow1,
            onPressed: onPressed),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: colorApp.yellow1,
        inactiveColor: Colors.black45,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget LocalAudio( String path) {

    return _tab([
      _btn(const Icon(Icons.play_arrow), () => audioCache.play(path)),
      _btn(const Icon(Icons.pause), () => advancedPlayer.pause()),
      _btn(const Icon(Icons.stop), () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Stack(
      children: [
        
        SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      const Text(""),
                      
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_forward_ios_sharp),),
                    ],
                ),
                const SizedBox(height: 50,),
                SvgPicture.asset("assets/svg/logo.svg"),
             Text(widget.hadith.key, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
             Text(widget.hadith.nameHadith,style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 30),),
             const SizedBox(height:50),
             SvgPicture.asset("assets/svg/listenHadith.svg"),
            
            Container(

              
              child:    LocalAudio(widget.localAudioPath),


            ),
          ],
        ),
      ],
    ),) ;
  }

}