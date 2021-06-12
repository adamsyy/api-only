import 'package:flutter/material.dart';

import 'movie.dart';

class Homed extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose One'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Tinder();
              }));
            },style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('Movies')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Tinder();
              }));
            },style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('News')),
          ),

        ],
      ),
    );
  }
}
