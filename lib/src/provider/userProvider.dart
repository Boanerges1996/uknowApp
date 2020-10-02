import 'package:flutter/material.dart';
import 'package:skulman/src/models/user.dart';

class StudentProvider extends ChangeNotifier {
  StudentInfo myInfo;
  StudentInfo getStudentInfo() {
    return myInfo;
  }

  void setStudentInfo(StudentInfo a) {
    myInfo = a;
    notifyListeners();
  }
}
