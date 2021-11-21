import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

List<AudioFile> audiolist = [
  AudioFile(
      title: 'dog bark',
      description: 'animal 1',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-69838/zapsplat_animals_dog_medium_sized_5x_barks_fast_slight_distance_70727.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'Cat',
      description: 'animal 2',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-344-audio/344_audio_barn_kitten_crying_scratching_meow_008.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'donkey',
      description: 'animal 3',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-felix-blume/felix_blume_animals_donkey_braying_loudly_field_village.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'frog',
      description: 'animal 4',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-felix-blume/felix_blume_animals_toads_frogs_night_pond_village_light_distant_chatter_in_bg.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'animal cry',
      description: 'animal 5',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-cartoon-animal-crying-in-pain-2.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'donkey cry',
      description: 'animal 6',
      url:
      'https://assets.mixkit.co/sfx/preview/mixkit-donkey-crying-310.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'sheep',
      description: 'animal 7',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-three/animals_sheep_x2_baa.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'goat',
      description: 'animal 8',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-one/animals_sheep_bleat_002.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'monkey',
      description: 'animal 9',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-audio-hero/audio_hero_Monkey_DIGIJ01-66.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'cow',
      description: 'animal 9',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-46416/zapsplat_animals_cow_moo_002_50436.mp3',
      playingstatus: 0),
  AudioFile(
      title: 'hen',
      description: 'animal 10',
      url:
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-one/animals_bird_cockrel_crow_in_barn.mp3',
      playingstatus: 0),
];

class AudioFile {
  final String title;
  final String description;
  final String url;
  int playingstatus;
  AudioFile({required this.title,required this.description, required this.url, this.playingstatus = 0});
}

class animal extends StatefulWidget {

  const animal({Key? key}) : super(key: key);

  @override
  _animalState createState() => _animalState();
}

class _animalState extends State<animal> {
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
          title: const Text("😹"),
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

