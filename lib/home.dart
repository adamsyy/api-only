import 'package:apionly/baseclientt1.dart';
import 'package:apionly/news.dart';
import 'package:apionly/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shortener/bitly_shortener.dart';
import 'package:get/get.dart';
import 'package:shlink/shlink.dart';
import 'controller.dart';
import 'movie.dart';
import 'package:apionly/shopremoteservices.dart';
import 'shopremoteservices.dart';

var x;

final Controller c = Get.put(Controller());

class Homed extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose One'),),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: ElevatedButton(onPressed: (){
              Get.to(Tinder());
            },style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('Movies')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: ElevatedButton(onPressed: (){   print('kjh');
            Get.to(News());
            },style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('News')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: ElevatedButton(onPressed: (){
              Get.to(HomePage());


                // var response=await BaseClient1().get('https://newsapi.org/v2/top-headlines?country=in&apiKey=','f57f267ec40b4a7684b4d06f23c3af4b');
                // var response1=response;
                // print(response1);
            },style: ElevatedButton.styleFrom(primary: Colors.black),
                child:Text('Shop')
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: ElevatedButton(onPressed: ()async{

              try{
                final shortener = BitLyShortener(accessToken: "2864efbe5b97074e7c077ab8844b089bd5237604");
                final linkData = await shortener.generateShortLink(longUrl: x);
                print(linkData.link);
              } on BitLyException catch(e){ //For handling BitLyException
                print(e);
              }

            },style: ElevatedButton.styleFrom(primary: Colors.black),
                child:Text('linker')
            ),
          ),
          TextField(
            onSubmitted: (value){
              x=value;
            },
          )




        ],
      ),
    );
  }
}
