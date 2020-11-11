import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skulman/src/models/user.dart';
import 'package:skulman/src/provider/userProvider.dart';
import 'package:skulman/src/screens/login/login.dart';

class Cover extends StatefulWidget {
  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> with SingleTickerProviderStateMixin {
  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // checkLogged();
    routeNextPage();
  }

  void routeNextPage() async {
    await Future.delayed(new Duration(seconds: 3));
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (loaded == true) {
      return Login();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.black,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Text(
          "SkulMan",
          style: GoogleFonts.piedra(
            decoration: TextDecoration.none,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
