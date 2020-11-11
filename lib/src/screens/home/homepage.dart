import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skulman/src/provider/bottomNav.dart';
import 'package:skulman/src/screens/home/botomNavigation.dart';
import 'package:skulman/src/screens/home/buyAndSell/bns.dart';
import 'package:skulman/src/screens/home/home/home.dart';
import 'package:skulman/src/screens/home/libraryPage/libraryPage.dart';
import 'package:skulman/src/screens/home/news/news.dart';
import 'package:skulman/src/screens/home/userDrawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setlogOut();
  }

  void setlogOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    BotomNav botom = Provider.of<BotomNav>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Colors.pink,
      ),
      body: [
        ActivityPage(),
        NewsPage(),
        BuyAndSellPage(),
        LibraryPage(),
      ].elementAt(botom.getIndex()),
      drawer: Drawer(
        child: UserDrawer(),
      ),
      bottomNavigationBar: MainBottomNav(),
    );
  }
}
