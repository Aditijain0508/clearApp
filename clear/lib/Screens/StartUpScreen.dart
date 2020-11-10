import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:clear/Screens/PageController.dart';

class StartUpScreen extends StatefulWidget {
  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return PageViewController();
            }),
          );
        },
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            print('Swipe right');
          } else if (details.delta.dx < 0) {
            print('Swipe left');
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xffEFE2DD),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome to',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' Clear',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Tap or swipe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' to begin',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
