import 'package:apionly/home.dart';
import 'package:apionly/movie.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme:ThemeData.dark(),debugShowCheckedModeBanner: false,
      home: Homed()
    );
  }
}
