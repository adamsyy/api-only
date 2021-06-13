import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'newsinfo.dart';
import 'newsinfo.dart';
import 'newsinfo.dart';
import 'newsinfo.dart';

Future<List<Welcome>> getnews()async{
  print("get news called");
  final client=await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  // var json=jsonDecode(client.body);
  // print("json is:${json}");
  List<Welcome> welocomemodel=welcomeFromJson(client.body);
  // print("welcome model is :${welocomemodel}");
  return welocomemodel;


}