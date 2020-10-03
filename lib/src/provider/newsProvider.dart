import 'package:flutter/material.dart';
import 'package:skulman/src/models/newsModel.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> news = [];

  List<NewsModel> getNews() {
    return news;
  }

  void setNews(List<NewsModel> a) {
    news = a;
    notifyListeners();
  }
}
