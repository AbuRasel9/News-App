import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news_app/view_model/news_view_model.dart';

import '../model/news_channel_headline_model.dart';

class ApiCallProvider with ChangeNotifier{
  //create variable
  NewsChannelHeadLineModel? _newsChannelHeadline;
  //create gretter method
  NewsChannelHeadLineModel? get newChannelHeadline=>_newsChannelHeadline;

  //setter method
  setNewsChannelHeadLine() async {
    final response =await NewsViewModel().getNewsHeadlineApi();
    _newsChannelHeadline=response;
    print(jsonEncode(_newsChannelHeadline));
    notifyListeners();

  }

}