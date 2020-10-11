import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/models/bns.dart';
import 'package:skulman/src/provider/bns.dart';
import 'package:skulman/src/screens/home/buyAndSell/bnsCards.dart';
import 'package:skulman/src/screens/home/buyAndSell/searchMenu.dart';

class BuyAndSellPage extends StatefulWidget {
  @override
  _BuyAndSellPageState createState() => _BuyAndSellPageState();
}

class _BuyAndSellPageState extends State<BuyAndSellPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBns();
  }

  Future<void> fetchBns() async {
    BNSProvider bns = Provider.of<BNSProvider>(context, listen: false);
    List<BNSModel> models = [];
    try {
      var data = await rootBundle.loadString("assets/data/bns.json");
      List info = json.decode(data);
      info.forEach((element) {
        models.add(
          BNSModel(
              contact: element["contact"],
              description: element["description"],
              email: element["email"],
              img: element["img"],
              name: element["name"],
              price: element["price"],
              type: element["type"]),
        );
      });
      // print(models);
      bns.setBns(models);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BNSCard();
  }
}
