import 'package:flutter/material.dart';
import 'package:skulman/src/screens/home/post/bns/bnsForm.dart';

class MakePost extends StatefulWidget {
  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  bool bns = false;
  bool news = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Make Post"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                ButtonTheme(
                  minWidth: 150,
                  buttonColor: Colors.pink,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        bns = true;
                        news = false;
                      });
                    },
                    child: Text(
                      "Buy and Sell",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonTheme(
                  minWidth: 150,
                  buttonColor: Colors.pink,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        bns = false;
                        news = true;
                      });
                    },
                    child: Text(
                      "News",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            (bns == true ? BNSForm() : Text(""))
          ],
        ),
      ),
    );
  }
}
