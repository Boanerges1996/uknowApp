import 'package:flutter/material.dart';
import 'package:skulman/src/screens/home/buyAndSell/selectedBNSPage.dart';
import 'package:skulman/src/screens/home/homepage.dart';
import 'package:skulman/src/screens/home/news/selectedNewsPage.dart';
import 'package:skulman/src/screens/home/post/makePost.dart';
import 'package:skulman/src/screens/login/login.dart';
import 'package:skulman/src/screens/signup/signup.dart';
import 'package:skulman/src/screens/signup/signup2.dart';

import '../../main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case "/signup":
        return MaterialPageRoute(
          builder: (_) => Signup(),
        );
      case "/main/page":
        return MaterialPageRoute(
          builder: (_) => MainPage(),
        );
      case "/selected/news":
        return MaterialPageRoute(
          builder: (_) => SelectedNewsPage(),
        );
      case "/make/post":
        return MaterialPageRoute(
          builder: (_) => MakePost(),
        );
      case "/selected/bns":
        return MaterialPageRoute(
          builder: (_) => SelectedBNSPage(),
        );
      case "/second/form":
        return MaterialPageRoute(
          builder: (_) => SecondForm(),
        );
    }
  }
}
