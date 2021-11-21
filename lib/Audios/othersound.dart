import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

List<AudioFile> audiolist = [
  AudioFile(
      title: 'car horn',
      description: 'audio 1',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-car-horn-718.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'train horn',
      description: 'audio 2',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-344-audio/344_audio_barn_kitten_crying_scratching_meow_008.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'funny clown horn',
      description: 'audio 3',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-funny-clown-horn-sounds-2886.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'happy party horn',
      description: 'audio 4',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-happy-party-horn-sound-530.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'trimmer',
      description: 'audio 5',
      url:
      'https://soundspunos.com/uploads/files/2018-10/1540899318_hair-cutting-razor_zjsp3bvu.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'ambulance siren',
      description: 'audio 6',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-ambulance-siren-uk-1640.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'imergency siren',
      description: 'audio 7',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-sci-fi-ship-siren-alert-1653.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'clapping sound',
      description: 'audio 8',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-small-crowd-clapping-3035.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'quick funny kiss',
      description: 'audio 9',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-quick-funny-kiss-2193.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Heavy rain on car glass interior',
      description: 'audio 9',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-heavy-rain-on-car-glass-interior-1248.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'glass breaking',
      description: 'audio 10',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-glass-break-with-hammer-thud-759.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'countdown',
      description: 'audio 11',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-clock-countdown-bleeps-916.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'metal tool falling',
      description: 'audio 12',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-metal-tool-falling-820.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'bell',
      description: 'audio 13',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-cartoon-door-melodic-bell-110.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'paper crumpled up',
      description: 'audio 14',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-paper-crumpled-up-2387.mp3',
      playingstatus: 0),

  AudioFile(
      title: 'whistle firework',
      description: 'audio 15',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-fast-whistle-firework-3103.mp3',
      playingstatus: 0),
];

class AudioFile {
  final String title;
  final String description;
  final String url;
  int playingstatus;
  AudioFile({required this.title,required this.description, required this.url, this.playingstatus = 0});
}

class other extends StatefulWidget {

  const other({Key? key}) : super(key: key);

  @override
  _otherState createState() => _otherState();
}

class _otherState extends State<other> {
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
          title: const Text("📢"),
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

