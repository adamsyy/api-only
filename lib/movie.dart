import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Tinder extends StatefulWidget {
  @override
  _TinderState createState() => _TinderState();
}

class _TinderState extends State<Tinder> {
  fetchmovies()async{
    var url;
    url=await get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=5f6f334d30e8d1d3ed12b35ba787d10a&language=en-US&page=1'));
    final jsondata=jsonDecode(url.body);

    return jsondata["results"];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Movies',style: TextStyle(fontSize: 25),),elevation: 0,),

      body: FutureBuilder(
          future: fetchmovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: (snapshot.data.length-1),itemBuilder: (BuildContext context,int index){
                return Row(
                  children: [
                    Container(height: 250,alignment:Alignment.centerLeft,
                      child: Card(
                        child: Image.network("https://image.tmdb.org/t/p/w500"+snapshot.data[index+1]["poster_path"]),
                      ),),
                    SizedBox(width: 20,),
                    Container(width: MediaQuery.of(context).size.width/2,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data[index+1]["original_title"],style: TextStyle(color: Colors.white),),
                          SizedBox(height: 10,),
                          Text(snapshot.data[index+1]["release_date"],style: TextStyle(color: Color(0xff868597))),
                          SizedBox(height: 10,),
                          Text(snapshot.data[index+1]["overview"],style: TextStyle(color:Color(0xff868597))),
                        ],
                      ),
                    ),
                  ],
                );
                // if(index>(snapshot.data.length-1)){
                //   index=1;
                // }
              });
            }


            return Center(child: CircularProgressIndicator(),);
          }

      ),

    );
  }
}
