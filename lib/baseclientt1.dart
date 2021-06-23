import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:apionly/appexceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient1{

  //get
  Future<dynamic> get(String baseurl,String api)async {
    var uri = Uri.parse(baseurl + api);
    try {
      var response = await http.get(uri);
      return _processResponse(response);
    }
    on SocketException {
      throw Fetchdataexceptions('no internet connection',uri.toString());
    }

  }
  //post
  Future<dynamic> post(String baseurl,String api,dynamic payloadobj)async {
    var uri = Uri.parse(baseurl + api);
    var payload=jsonDecode(payloadobj);
    try {
      var response = await http.post(uri,body: payload);
      return _processResponse(response);
    }
    on SocketException {
      throw Fetchdataexceptions('no internet connection',uri.toString());
    }

  }


  dynamic _processResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        var responseJson=jsonDecode(response.body);
        return responseJson;
        break;
      case 400: throw Badrequestexceptions(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401: throw Fetchdataexceptions(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:throw Apinoresponseexceptions(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:throw unauthrisedexceptions(utf8.decode(response.bodyBytes), response.request!.url.toString());
      default: throw Fetchdataexceptions('Error occured', response.request!.url.toString());
    }
  }

}