import 'package:flutter/material.dart';
import 'package:skulman/src/models/bns.dart';

class BNSProvider extends ChangeNotifier {
  List<BNSModel> bns = [];

  List<BNSModel> getBns() {
    return bns;
  }

  void setBns(List<BNSModel> a) {
    bns = a;
    notifyListeners();
  }
}
