import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/models/newsModel.dart';
import 'package:skulman/src/provider/newsProvider.dart';
import 'package:skulman/src/screens/home/news/newCard.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FectNews
    fetchNews();
  }

  Future<void> fetchNews() async {
    NewsProvider newsProv = Provider.of<NewsProvider>(context, listen: false);
    List<NewsModel> newses = [];
    var data = await rootBundle.loadString("assets/data/news.json");
    List info = json.decode(data);
    info.forEach((element) {
      newses.add(
        new NewsModel(
            title: element["title"],
            content: element["content"],
            date: element["date"],
            img: element["img"]),
      );
    });
    newsProv.setNews(newses);
    // print(newses);
  }

  @override
  Widget build(BuildContext context) {
    return NewsCards();
  }
}
