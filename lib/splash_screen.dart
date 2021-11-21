import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/wall.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('Prank Sounds',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'bell-mt-grassetto',
                      color: Colors.white,
                    )),
                Divider(
                  color: Colors.white,
                  endIndent: 125,
                  indent: 125,
                ),
                Text(
                  'Make everyone laugh',
                  style: TextStyle(fontSize: 15, color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}