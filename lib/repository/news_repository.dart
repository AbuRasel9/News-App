import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news_app/model/news_channel_headline_model.dart';
class NewsRepository{
  Future<NewsChannelHeadLineModel>getNewsHeadlineApi(String url)async{
    try{

      http.Response response=await http.get(Uri.parse(url));

      if(response.statusCode==200){
        final body=jsonDecode(response.body);
        return  NewsChannelHeadLineModel.fromJson(body);
      }

    }catch (e){
      print(e);
    }
    throw Exception("error");

  }
}