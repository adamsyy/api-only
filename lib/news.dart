import 'dart:convert';


import 'package:apionly/country.dart';



import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.youtube.com/watch?v=MXE7FMRVm3E';

class News extends StatefulWidget {

  @override

  _NewsState createState() => _NewsState();

}


class _NewsState extends State<News> {


   getnews()async{
    print("get news called");
    final client=await get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2021-06-19&to=2021-06-19&sortBy=popularity&apiKey=f57f267ec40b4a7684b4d06f23c3af4b'));
    var data=jsonDecode(client.body);
  return data;

  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text('News'),),

      body: Container(

        child:
        FutureBuilder(future:getnews(),builder:(BuildContext context,AsyncSnapshot snapshot){


          if(snapshot.hasData){



            return ListView.builder(itemCount: snapshot.data["articles"].length,itemBuilder: (BuildContext context,int index){



              return GestureDetector(onTap:()async{
                await launch(snapshot.data["articles"][index]["url"].toString());
              },
                child: Row(

                  children: [
                    Container(height: 150,alignment:Alignment.centerLeft,width: MediaQuery.of(context).size.width/2,
                      child: Card(
                        child: Image.network(snapshot.data["articles"][index+3]["urlToImage"].toString()),
                      ),),
                    SizedBox(width: 20,),
                    Container(width: MediaQuery.of(context).size.width/2.25,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data["articles"][index]["title"],style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(snapshot.data["articles"][index]["author"].toString(),style: TextStyle(color: Color(0xff868597)),),


                        ],
                      ),
                    ),
                  ],
                ),
              );

            });



          }


          return CircularProgressIndicator();} ,


        ),


      ),

      // floatingActionButton: FloatingActionButton(
      //
      //   child: Text('hlo'),onPressed: (){ }
      //
      //
      //
      //
    //


    );

  }

}


// void _launchURL(String url) async {
// launch(url);
// }