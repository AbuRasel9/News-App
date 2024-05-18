import 'package:news_app/repository/news_repository.dart';

import '../model/news_channel_headline_model.dart';

class NewsViewModel{
  Future<NewsChannelHeadLineModel>getNewsHeadlineApi() async {
    final response=await NewsRepository().getNewsHeadlineApi("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=4d57d615978c44be8890a54cc430b6e1");
    return response;

  }
}