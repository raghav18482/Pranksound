import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

List<AudioFile> audiolist = [
  AudioFile(
      title: 'laughing witch',
      description: 'Horror',
      url:
      'https://quz1yp-a.akamaihd.net/downloads/ringtones/files/mp3/witch-laugh-28505.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'wolf',
      description: 'Horror',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-wolves-pack-howling-1776.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Scary noise',
      description: 'Horror',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-wolves-at-scary-forest-2485.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'ghost voices',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/nightmare-voices-ambiance_MkhKVB4O_NWM.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'hessi monster sound ',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/hissy-monster-sound_z1fbWSVu_NWM.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'horror creature voice',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/long-warning-horror-whirr_fJOP5BNO_NWM.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Evil Spell Voice',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/evil-spell-voice_zJwwln4__NWM.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Distant Creepy Dog Howling',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/distant-creepy-dog-howling_zkNjfHNd_NWM.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Scream Effect Reverb',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/scream-effect-reverb_f1Hx-34__NWM.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Monster Demon Horses Scream',
      description: 'Horror',
      url:
      'https://dm0qx8t0i9gc9.cloudfront.net/previews/audio/BsTwCwBHBjzwub4i4/monster-demon-horses-scream_MyUKNh4O_NWM.mp3',
      playingstatus: 0),
];

class AudioFile {
  final String title;
  final String description;
  final String url;
  int playingstatus;
  AudioFile({required this.title,required this.description, required this.url, this.playingstatus = 0});
}

class horror extends StatefulWidget {

  const horror({Key? key}) : super(key: key);

  @override
  _horrorState createState() => _horrorState();
}

class _horrorState extends State<horror> {
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
          title: const Text("😈"),
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

