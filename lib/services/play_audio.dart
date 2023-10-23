import 'package:audioplayers/audioplayers.dart';


class AudioService{

   static playSound(String noteNo) async {
    final player = AudioPlayer();
    await player.play(AssetSource("calimba_sounds/$noteNo.MP3"));
  }
}