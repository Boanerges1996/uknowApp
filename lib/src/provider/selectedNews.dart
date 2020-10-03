import 'package:flutter/material.dart';
import 'package:skulman/src/models/newsModel.dart';

class SelectedNewsProvider extends ChangeNotifier {
  NewsModel a;
  NewsModel getSelectedNews() {
    return a;
  }

  void setSelectedNews(NewsModel b) {
    a = b;
    notifyListeners();
  }
}
