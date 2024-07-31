import 'package:flutter/material.dart';

import 'View/ITunesSearch_Screen.dart';



void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iTunes Search',
      theme: ThemeData(),
      home: ITunesSearchScreen(),
    );
  }
}
