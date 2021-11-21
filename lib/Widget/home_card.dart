import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


final List<Card_model> exercise = [
  Card_model(
      imgurl: 'assets/images-24.jpeg',
      title: 'wet fart prank',
      duration: '07:35 min',
      vid: 'xbVNZ1eLZlE',
  ),
  Card_model(
      imgurl: 'assets/images-24.jpeg',
      title: 'GilstrapTV',
      duration: '07:35 min',
      vid: 'bON00kB4X4c',
  ),
  Card_model(
    imgurl: 'assets/images-24.jpeg',
    title: 'hidden speaker prank ',
    duration: '07:35 min',
    vid: '56MtwpAE9t4',
  ),
];
class Card_model{
  String imgurl;
  String title;
  String duration;
  String vid;
  Card_model({required this.imgurl,required this.title,required this.duration,required this.vid});
}


Widget buildexercise(BuildContext context, int index) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(right: 7),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(exercise[index].imgurl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.025,
          ),
          FlatButton(
            onPressed: () {
              showGeneralDialog(
                barrierDismissible: true,
                barrierLabel: '',
                barrierColor: Colors.black38,
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (ctx, anim1, anim2) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: exercise[index].vid,//Add videoID.
                            flags: const YoutubePlayerFlags(
                              hideControls: false,
                              controlsVisibleAtStart: true,
                              autoPlay: false,
                              mute: false,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                        )
                      ),
                    ],
                  ),
                ),
                transitionBuilder: (ctx, anim1, anim2, child) =>
                    BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 4 * anim1.value,
                          sigmaY: 4 * anim1.value),
                      child: FadeTransition(
                        child: child,
                        opacity: anim1,
                      ),
                    ),
                context: context,
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/Group 287@2x.png'),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exercise[index].title,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'OpenSans-Bold'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}