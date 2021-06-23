// @dart=2.9
import 'package:apionly/home.dart';
import 'package:apionly/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(theme:ThemeData.dark(),debugShowCheckedModeBanner: false,
      home: Homed()
    );
  }
}
