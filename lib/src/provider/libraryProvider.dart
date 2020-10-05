import 'package:flutter/material.dart';
import 'package:skulman/src/models/libraryModel.dart';

class LibraryProvider extends ChangeNotifier {
  List<LibraryModel> libraries = [];
  List<LibraryModel> getLibraries() {
    return libraries;
  }

  void setLibrary(List<LibraryModel> a) {
    libraries = a;
    notifyListeners();
  }
}
