import 'package:flutter/material.dart';
import 'package:skulman/src/screens/home/home/sliderImg.dart';
import 'package:skulman/src/screens/home/news/newCard.dart';
import 'package:skulman/src/screens/home/news/news.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          CarouselWithIndicatorDemo(),
        ],
      )),
    );
  }
}
