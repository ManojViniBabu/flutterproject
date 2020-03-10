import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'ApiException.dart';

//TODO CreateApi helper class

class  ApiBaseHelper{
  //local variable
  final  String _baseUrl = "http://www.mocky.io/";
  //TODO Make a function http request which returns json response
  //With error handling
  Future<dynamic> get(String url) async{
    var responseJson;
    try{
      final response =await http.get(_baseUrl+url);
      responseJson =_returnResponse(response);

    }on SocketException{
      throw FetchDataException(' No Internet connection');


    }
    return responseJson;


}

}

//TODO create a function of switch cases handling
//200
//400
//401
//403
//500

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200 :
      var responseJson = json.decode(response.body.toString());
     // print (responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:

    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
    throw FetchDataException('Error occured while communicating with server with statuscode:${response.statusCode}');


  }
}




