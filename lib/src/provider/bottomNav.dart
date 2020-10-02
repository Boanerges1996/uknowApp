import 'package:flutter/material.dart';

class BotomNav extends ChangeNotifier {
  int index = 0;
  int getIndex() {
    return index;
  }

  void setIndex(int a) {
    index = a;
    notifyListeners();
  }
}
