import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/bottomNav.dart';
import 'package:skulman/src/provider/libraryProvider.dart';
import 'package:skulman/src/provider/newsProvider.dart';
import 'package:skulman/src/provider/selectedNews.dart';
import 'package:skulman/src/provider/userProvider.dart';
import 'package:skulman/src/route/route.dart';
import 'package:skulman/src/screens/first/cover.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BotomNav(),
        ),
        ChangeNotifierProvider(
          create: (_) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedNewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LibraryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: Cover(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
