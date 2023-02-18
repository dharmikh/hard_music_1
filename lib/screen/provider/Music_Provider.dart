import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hard_music_1/screen/model/Music_Model.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioProvider extends ChangeNotifier {
  List<MusicModel> m1 = [
    MusicModel(
        name: "Kya bolti Compny",
        titel: "🤟Advisor By ViditBhai🤟",
        music:
            "assets/music/Company(PagalWorld.com.se).mp3",
        color: Colors.deepOrangeAccent,
        singer: "Emiway Bantai",
        image: "assets/image/image12.jpg",
        isplay: false),
    MusicModel(
        name: "3:69",
        titel: "🤟Advisor By ViditBhai🤟",
        music: "assets/music/divine.mp3",
        color: Colors.deepPurple,
        singer: "Divine",
        image: "assets/image/divine.jpg",
        isplay: false),
    MusicModel(
        name: "So high",
        titel: "🤟Advisor By ViditBhai🤟",
        music: "assets/music/musewala.mp4",
        color: Colors.teal,
        singer: "Sidhu Musewala",
        image: "assets/image/sidhu.jpg",
        isplay: false),
    MusicModel(
        name: "Snake",
        titel: "🤟Advisor By ViditBhai🤟",
        music: "assets/music/stan.mp4",
        color: Colors.blue,
        singer: "Mc stan",
        image: "assets/image/mc satnd.png",
        isplay: false),
    MusicModel(
        name: "Firse Machayenge",
        titel: "🤟Advisor By ViditBhai🤟",
        music: "assets/music/emv.mp4",
        color: Colors.orange,
        singer: "Emiway Bantai",
        image: "assets/image/emv.jpg",
        isplay: false),
  ];
  String? songpath =
      "music_player_6-master/assets/music/Company(PagalWorld.com.se).mp3";
  int i = 0;
  int index = 0;
  bool mute = true;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration songDuration = Duration(seconds: 0);

  void changeplay(bool value) {
    m1[index].isplay = value;
    notifyListeners();
  }

  void loadAudio() {
    print(songpath);
    assetsAudioPlayer.open(Audio("${songpath}"), autoStart: false);
    print(songpath);
    totalDuration();
    notifyListeners();
  }

  void totalDuration() {
    assetsAudioPlayer.current.listen((event) {
      songDuration = event!.audio.duration;
    });
    notifyListeners();
  }

  MusicModel? data;

  void AddData(MusicModel da, inde) {
    data = da;
    index = inde;
    notifyListeners();
  }

  void changesongPath(value) {
    songpath = value;
    notifyListeners();
  }

  void stopAudio() {
    assetsAudioPlayer.stop();
    notifyListeners();
  }

  void muteAudio() {
    mute = !mute;
    mute ? assetsAudioPlayer.setVolume(1) : assetsAudioPlayer.setVolume(0);
    notifyListeners();
  }
}
