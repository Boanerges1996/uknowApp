import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/selectedBnc.dart';

class SelectedBNSPage extends StatefulWidget {
  @override
  _SelectedBNSPageState createState() => _SelectedBNSPageState();
}

class _SelectedBNSPageState extends State<SelectedBNSPage> {
  @override
  Widget build(BuildContext context) {
    SelectedBNS selbns = Provider.of<SelectedBNS>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          selbns.getBns().name,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: selbns.getBns().img,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                selbns.getBns().name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Price  ",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "₹ " + selbns.getBns().price,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                selbns.getBns().description,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Owner Details",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Icon(
                    FontAwesomeIcons.user,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    selbns.getBns().contact,
                    style: TextStyle(fontSize: 20),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
