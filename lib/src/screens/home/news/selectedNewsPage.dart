import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/selectedNews.dart';
import 'package:skulman/src/screens/first/aboutUs.dart';

class SelectedNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectedNewsProvider selectedNews =
        Provider.of<SelectedNewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedNews.getSelectedNews().title),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: selectedNews.getSelectedNews().img,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Text(
                  selectedNews.getSelectedNews().content,
                  style: GoogleFonts.aladin(fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  selectedNews.getSelectedNews().date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              AboutUs()
            ],
          ),
        ),
      ),
    );
  }
}
