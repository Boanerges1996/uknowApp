import 'package:flutter/material.dart';
import 'package:skulman/src/models/bns.dart';

class SelectedBNS extends ChangeNotifier {
  BNSModel data;
  BNSModel getBns() {
    return data;
  }

  void setBns(BNSModel info) {
    data = info;
    notifyListeners();
  }
}
