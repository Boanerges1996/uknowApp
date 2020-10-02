import 'package:flutter/material.dart';
import 'package:skulman/src/screens/home/homepage.dart';
import 'package:skulman/src/screens/login/login.dart';
import 'package:skulman/src/screens/signup/signup.dart';

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
    }
  }
}
