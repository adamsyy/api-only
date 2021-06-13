import 'dart:convert';


import 'package:apionly/newsapi.dart';

import 'package:apionly/newsinfo.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart';


import 'newsapi.dart';

import 'newsapi.dart';



class News extends StatefulWidget {

  @override

  _NewsState createState() => _NewsState();

}


class _NewsState extends State<News> {


  Future<List<Welcome>>? _welcome;


  @override

  void initState() {

    super.initState();

    _welcome=getnews();


  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text('News'),),

      body: Container(

        child: FutureBuilder<List<Welcome>?>(future: _welcome,builder:(BuildContext context,AsyncSnapshot snapshot){


          if(snapshot.hasData){

            List<Welcome>list=snapshot.data;

            return ListView.builder(itemCount: list.length,itemBuilder: (BuildContext context,int index){

              Welcome welcome=list[index];

              return Container(

                child:Row(

                  children: [

                    Text("${welcome.id}"),

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