import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skulman/src/provider/userProvider.dart';
import 'package:skulman/src/request/updateUser.dart';

class SecondForm extends StatefulWidget {
  @override
  _SecondFormState createState() => _SecondFormState();
}

enum SingingCharacter { isLocal, notLocal }

class _SecondFormState extends State<SecondForm> {
  final formkey = GlobalKey<FormState>();

  bool clickedSignup = false;
  SingingCharacter _character = SingingCharacter.isLocal;
  String firstname;
  String lastname;
  String year;
  bool isLocal;
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
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
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  firstWig(context),
                  SizedBox(
                    height: 15,
                  ),
                  lastWig(context),
                  SizedBox(
                    height: 15,
                  ),
                  radioWig(context),
                  SizedBox(
                    height: 15,
                  ),
                  dropWig(context),
                  SizedBox(
                    height: 15,
                  ),
                  updateBtn(context),
                  SizedBox(
                    height: 15,
                  ),
                  (clickedSignup == true ? loadingBtn() : Text(""))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget firstWig(context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Firstname",
        hintText: "john",
        errorStyle: TextStyle(color: Colors.white),
      ),
      validator: (data) {
        if (data.length != 0) {
          return null;
        } else
          return "Please firstname is required";
      },
      onSaved: (data) {
        setState(() {
          firstname = data;
        });
      },
    );
  }

  Widget lastWig(context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Firstname",
        hintText: "john",
        errorStyle: TextStyle(color: Colors.white),
      ),
      validator: (data) {
        if (data.length != 0) {
          return null;
        } else
          return "Please lastname is required";
      },
      onSaved: (data) {
        setState(() {
          lastname = data;
        });
      },
    );
  }

  Widget radioWig(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Is Local",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        ListTile(
          title: const Text('True'),
          leading: Radio(
            value: SingingCharacter.isLocal,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                isLocal = true;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('False'),
          leading: Radio(
            value: SingingCharacter.notLocal,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                isLocal = false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget dropWig(BuildContext context) {
    return Row(
      children: [
        Text("Year", style: TextStyle(fontSize: 25, color: Colors.white)),
        SizedBox(
          width: 15,
        ),
        DropdownButton<String>(
          hint: Text("Year"),
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Three', 'Four', 'Five', 'Six']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget updateBtn(context) {
    StudentProvider student = Provider.of<StudentProvider>(context);
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 55,
      buttonColor: Colors.black,
      child: RaisedButton(
        onPressed: () async {
          print(student.getStudentInfo().id);
          if (formkey.currentState.validate()) {
            formkey.currentState.save();
            setState(() {
              clickedSignup = true;
            });
            UpdateUser update = UpdateUser(
              firstname: firstname,
              lastname: lastname,
              id: student.getStudentInfo().id,
              year: dropdownValue,
              isLocal: isLocal,
            );
            var data = await update.update();
            print(data);
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setBool("logged", true);
            pref.setString("id", student.getStudentInfo().id);
            pref.setString("pic", data["pic"]);
            pref.setString("firstname", firstname);
            pref.setString("lastname", lastname);
            pref.setString("year", data["year"]);
            pref.setString("email", data["email"]);
            pref.setString("telephone", data["telephone"]);

            setState(() {
              clickedSignup = false;
            });
            Navigator.of(context).popAndPushNamed("/main/page");
            // print(_character);
          }
        },
        child: Text(
          "Saved",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget loadingBtn() {
    return Center(
      child: Loading(
        indicator: BallSpinFadeLoaderIndicator(),
        size: 60,
        color: Colors.blue,
      ),
    );
  }
}
