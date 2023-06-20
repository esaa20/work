import 'package:flutter/material.dart';
import 'package:work/screens/homework.dart';
import 'package:work/screens/splash.dart';
import 'package:work/widget/new_work.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Work',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:  Splash(),
      routes: {
        HomeWork.routeName: (ctx) => HomeWork(),
      },
    );
  }
}


