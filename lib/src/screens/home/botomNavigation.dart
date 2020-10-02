import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/bottomNav.dart';

class MainBottomNav extends StatefulWidget {
  @override
  _MainBottomNavState createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  @override
  Widget build(BuildContext context) {
    BotomNav botom = Provider.of<BotomNav>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Colors.black,
              ),
            ),
        //Sets the texts color of the unselected element
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.pink,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("News"),
            icon: Icon(FontAwesomeIcons.newspaper),
          ),
          BottomNavigationBarItem(
              title: Text("buyNsell"),
              icon: Icon(FontAwesomeIcons.handHolding)),
          BottomNavigationBarItem(
              title: Text("Library"),
              icon: Icon(
                Icons.book,
              ))
        ],
        onTap: (index) {
          botom.setIndex(index);
        },
        currentIndex: botom.getIndex(),
      ),
    );
  }
}
