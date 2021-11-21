import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

List<AudioFile> audiolist = [
  AudioFile(
      title: 'quick fart',
      description: 'fart',
      url:
      'https://www.pacdv.com/sounds/preview/fart-wav-4.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Cartoon fart or splat',
      description: 'fart',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-cartoon-fart-or-splat-3056.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'blow fart',
      description: 'fart',
      url:
      'https://www.soundjay.com/human/sounds/fart-squeak-03.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'tight fart',
      description: 'fart',
      url:
      'https://www.pacdv.com/sounds/preview/fart-wav-4.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'toilet fart',
      description: 'fart',
      url:
      'https://www.pacdv.com/sounds/preview/fart-wav-2.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Farting doubt male laugh',
      description: 'fart',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-farting-doubt-male-laugh-3054.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Scooter fart',
      description: 'fart',
      url:
      'https://www.soundjay.com/human/sounds/fart-08.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Farting balloon deflate',
      description: 'fart',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-farting-balloon-deflate-3052.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'triple fart',
      description: 'fart',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-cartoon-fart-triple-3055.mp3',
      playingstatus: 0),
];

class AudioFile {
  final String title;
  final String description;
  final String url;
  int playingstatus;
  AudioFile({required this.title,required this.description, required this.url, this.playingstatus = 0});
}

class fart extends StatefulWidget {

  const fart({Key? key}) : super(key: key);

  @override
  _fartState createState() => _fartState();
}

class _fartState extends State<fart> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0XFF5C101B), Color(0XFFC5351A)])),
          ),
          title: const Text("🤭"),
        ),
        body: MyItem(
          audioPlayer: audioPlayer,
        ));
  }
}

class MyItem extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const MyItem({Key? key, required this.audioPlayer}) : super(key: key);
  @override

  _MyItemState createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  late int result;
  int status = 0;
  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audiolist.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async {
            if (audiolist[index].playingstatus == 0) {
              result = await widget.audioPlayer.stop();
              result = await widget.audioPlayer
                  .play(audiolist[index].url, isLocal: true);
              setState(() {
                for (int i = 0; i < audiolist.length; i++) {
                  audiolist[i].playingstatus = 0;
                }
                audiolist[index].playingstatus = 1;
              });
            } else if (audiolist[index].playingstatus == 1) {
              result = await widget.audioPlayer.stop();
              setState(() {
                for (int i = 0; i < audiolist.length; i++) {
                  audiolist[i].playingstatus = 0;
                }
              });
            }
          },
          child: ListTile(
            leading: Icon(Icons.music_note_outlined),
            title: Text(audiolist[index].title),
            subtitle: Text(audiolist[index].description),
            trailing: audiolist[index].playingstatus == 0

                ? Icon(Icons.play_arrow)
                : Icon(Icons.pause),
          ),
        );
      },
    );
  }
}

