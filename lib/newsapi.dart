import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'newsinfo.dart';

Future<Welcome> getnews()async{
  final client=await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var json=jsonDecode(client.body);
  var welocomemodel=Welcome.fromJson(json);
  print(welocomemodel);
  return welocomemodel;


}