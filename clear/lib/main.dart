import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clear/model/Task_data.dart';
import 'package:clear/Screens/StartUpScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.green,
          body: StartUpScreen(),
        ),
      ),
    );
  }
}
