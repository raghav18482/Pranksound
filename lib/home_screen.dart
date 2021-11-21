import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pranksound/Audios/animals.dart';
import 'package:pranksound/Audios/fart.dart';

import 'Audios/horror.dart';
import 'Audios/othersound.dart';
import 'Widget/home_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {

  String videoURL = "https://www.youtube.com/watch?v=n8X9_MgEdCg";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF5C101B), Color(0XFFC5351A)])),
        ),
        title: const Text("Get Set Prank 😜"),
      ),
      body: Column(
          children: <Widget>[
            Expanded(
                child: GridView.extent(
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 200.0,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          elevation: 20,
                          shadowColor: Colors.black,
                          color: Color(0xFFFFF9C4),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => horror()),
                              );
                            },
                            child: SizedBox(
                              width: 300,
                              height: 500,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Lottie.network(
                                      'https://assets10.lottiefiles.com/packages/lf20_ncVvTS.json',
                                      height: 70,
                                    ),//CirclAvatar
                                    const SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                    Text(
                                      'Horror',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.w500,
                                      ), //Textstyle
                                    ), //Text//SizedBox//SizedBox
                                  ],
                                ), //Column
                              ), //Padding
                            ),
                          )//SizedBox
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Color(0xFFFFF9C4),
                        child: SizedBox(
                          width: 300,
                          height: 500,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => fart()),
                                  );
                                },
                                child: SizedBox(
                                  width: 300,
                                  height: 500,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Lottie.network(
                                          'https://assets6.lottiefiles.com/packages/lf20_tUNxOx.json',
                                          height: 70,
                                        ),//CirclAvatar
                                        const SizedBox(
                                          height: 10,
                                        ), //SizedBox
                                        Text(
                                          'fart',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ), //Text//SizedBox//SizedBox
                                      ],
                                    ), //Column
                                  ), //Padding
                                ),
                              ) //Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        elevation: 16,
                        shadowColor: Colors.black,
                        color: Color(0xFFFFF9C4),
                        child: SizedBox(
                          width: 300,
                          height: 500,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:  InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => animal()),
                                  );
                                },
                                child: SizedBox(
                                  width: 300,
                                  height: 500,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Lottie.network(
                                          'https://assets8.lottiefiles.com/packages/lf20_yriifcob.json',
                                          height: 70,
                                        ),//CirclAvatar
                                        const SizedBox(
                                          height: 10,
                                        ), //SizedBox
                                        Text(
                                          'Animal',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ), //Text//SizedBox//SizedBox
                                      ],
                                    ),
                                  ), //Padding
                                ),
                              )//Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        elevation: 16,
                        shadowColor: Colors.black,
                        color: Color(0xFFFFF9C4),
                        child: SizedBox(
                          width: 300,
                          height: 500,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => other()),
                                  );
                                },
                                child: SizedBox(
                                  width: 300,
                                  height: 500,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Lottie.network(
                                          'https://assets3.lottiefiles.com/packages/lf20_sy2feyup.json',
                                          height: 70,
                                        ),//CirclAvatar
                                        const SizedBox(
                                          height: 13,
                                        ), //SizedBox
                                        Text(
                                          'Other Sounds',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ), //Text//SizedBox//SizedBox
                                      ],
                                    ),
                                  ), //Padding
                                ),
                              )//Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1, left: MediaQuery.of(context).size.width * 0.1,top: 5,bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'PRANK VIDEOS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'OpenSans'),
                  ),
                  //SizedBox(width:110 ,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.only(left: 4,right:4,bottom: 100),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    buildexercise(context, index),
                itemCount: exercise.length,
              ),
            ),// new Text("text"),
          ],
      ),
    );
  }
}







