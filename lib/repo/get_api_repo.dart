

import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_manegment/modal/get_api_modal.dart';
import 'package:http/http.dart' as http;
class GetApiRepo{
  
  Future<List<GetApiModal>> getApi() async {
    
    try{
     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

     if(response.statusCode == 200){
       Iterable data = jsonDecode(response.body);
        List<GetApiModal> list = List<GetApiModal>.from(data.map((e) => GetApiModal.fromJson(e))).toList();
        return list;
     }
    }on SocketException{
     throw ('Socket Exception');
    }
    throw Exception('Something Error');
  }
}