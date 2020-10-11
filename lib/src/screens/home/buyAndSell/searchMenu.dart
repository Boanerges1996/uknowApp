import 'package:flutter/material.dart';

class SearchBNS extends StatefulWidget {
  @override
  _SearchBNSState createState() => _SearchBNSState();
}

class _SearchBNSState extends State<SearchBNS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height / 8.5,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 12,
                child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 2,
                            spreadRadius: 1,
                          )
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search item..",
                        icon: Icon(Icons.search),
                      ),
                    ))),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 2,
                        spreadRadius: 1,
                      )
                    ]),
                child: Center(
                  child: Icon(
                    Icons.tune,
                    color: Colors.red[400],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
