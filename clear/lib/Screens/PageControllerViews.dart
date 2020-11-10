import 'dart:ui';

import 'package:flutter/material.dart';

class PageControllerViews extends StatefulWidget {
  final String text;
  final String secondaryText;
  final String imageString;

  PageControllerViews(
      {@required this.text,
      @required this.imageString,
      @required this.secondaryText});
  @override
  _PageControllerViewsState createState() => _PageControllerViewsState();
}

class _PageControllerViewsState extends State<PageControllerViews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xffEFE2DD),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.secondaryText,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Image(
                  image: AssetImage(widget.imageString),
                ),
              )
            ],
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
