import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skulman/src/provider/libraryProvider.dart';

class LibraryCard extends StatefulWidget {
  @override
  _LibraryCardState createState() => _LibraryCardState();
}

class _LibraryCardState extends State<LibraryCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    LibraryProvider libraryProv = Provider.of<LibraryProvider>(context);
    return ListView.builder(
      itemCount: libraryProv.getLibraries().length,
      itemExtent: 120,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              trailing: Icon(FontAwesomeIcons.trash),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 120,
                  minHeight: 120,
                  maxWidth: 120,
                  maxHeight: 120,
                ),
                child: Column(
                  children: [
                    Text(
                      libraryProv.getLibraries()[index].courseCode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.folderOpen,
                      size: 25,
                    ),
                  ],
                ),
              ),
              title: Text(
                libraryProv.getLibraries()[index].courseName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
