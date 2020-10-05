import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:skulman/src/models/libraryModel.dart';
import 'package:skulman/src/provider/libraryProvider.dart';
import 'package:skulman/src/screens/home/libraryPage/libraryCard.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch libraries
    fetchLibraries();
  }

  Future<void> fetchLibraries() async {
    try {
      LibraryProvider libraryProv =
          Provider.of<LibraryProvider>(context, listen: false);
      List<LibraryModel> libraries = [];
      var data = await rootBundle.loadString("assets/data/library.json");
      List info = json.decode(data);
      info.forEach((element) {
        libraries.add(
          new LibraryModel(
            courseCode: element["Course Code"],
            courseName: element["Course Name"],
          ),
        );
      });
      libraryProv.setLibrary(libraries);
    } catch (err) {
      print(err);
    }
  }

  Widget build(BuildContext context) {
    return LibraryCard();
  }
}
