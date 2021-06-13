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

late Future <Welcome> _welcome;

@override
  void initState() {
    super.initState();

    _welcome=getnews();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('News'),),
      body: Container(
        child: FutureBuilder<Welcome>(future: _welcome,builder:(BuildContext context,AsyncSnapshot snapshot){

    if(snapshot.hasData){
    return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
    return Container(
    child:Row(
    children: [
    Text('hlo'),
    ],
    ) ,
    );
    });


    }

        return CircularProgressIndicator();} ,

        ),

      ),
floatingActionButton: FloatingActionButton(
  child: Text('hlo'),onPressed: ()async{ await getnews();

},
),
    );
  }
}
