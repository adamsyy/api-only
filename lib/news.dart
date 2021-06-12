import 'dart:convert';

import 'package:apionly/newsapi.dart';
import 'package:apionly/newsinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {


getnews()async{
    final client=await get(Uri.parse(Strings.url));
    var json=jsonDecode(client.body);
      print(json["articles"][1]);


   return json;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('News'),),
      body: Container(
        child: FutureBuilder(future: getnews(),builder:(BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasError){print('hlo');}
    if(snapshot.hasData){
    return ListView.builder(itemCount:snapshot.data.length,itemBuilder: (BuildContext context,int index){
    return Container(
    child:Row(
    children: [
    Text(snapshot.data["articles"][index]["source"].toString())
    ],
    ) ,
    );
    });

    }

        return CircularProgressIndicator();} ,

        ),
      ),
floatingActionButton: FloatingActionButton(
  child: Text('hlo'),onPressed: ()async{ print('hlooooo');
    await getnews();
},
),
    );
  }
}
