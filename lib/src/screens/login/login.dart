import 'package:email_validator/email_validator.dart' as e;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skulman/src/models/user.dart';
import 'package:skulman/src/provider/userProvider.dart';
import 'package:skulman/src/request/login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  String password;
  String email;

  bool clickedBool = false;

  final paswordValidator = MultiValidator(
    [
      RequiredValidator(errorText: "Password Require"),
      MinLengthValidator(8, errorText: "Minimum length of 8"),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'passwords must have at least one special character')
    ],
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogged();
  }

  void checkLogged() async {
    StudentProvider prov = Provider.of<StudentProvider>(context, listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getBool("logged"));
    if (pref.getBool("logged") == true) {
      StudentInfo stu = StudentInfo.fromDatabase(
        firstname: pref.getString("firstname"),
        lastname: pref.getString("lastname"),
        email: pref.getString("email"),
        pic: pref.getString("pic"),
        id: pref.getString("id"),
        logged: pref.getBool("logged"),
        telephone: pref.getString("telephone"),
        year: pref.getString("year"),
      );
      prov.setStudentInfo(stu);
      Navigator.of(context).popAndPushNamed("/main/page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
              children: [
                skulMan(context),
                SizedBox(
                  height: 20,
                ),
                emailWig(context),
                SizedBox(
                  height: 10,
                ),
                passwordWig(context),
                SizedBox(
                  height: 10,
                ),
                loginBtn(context),
                SizedBox(
                  height: 10,
                ),
                (this.clickedBool ? loadingBtn() : Text("")),
                signupLink()
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget skulMan(context) {
    return Text(
      "Skulman \n   Login",
      style: TextStyle(
        fontSize: 45,
        color: Colors.blue,
      ),
    );
  }

  Widget emailWig(context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Email",
        hintText: "john.doe@123.com",
      ),
      validator: (data) {
        if (e.EmailValidator.validate(data)) {
          return null;
        } else
          return "Please enter a valid email address";
      },
      onSaved: (data) {
        email = data;
      },
    );
  }

  Widget passwordWig(context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Password",
        hintText: "*****",
      ),
      validator: paswordValidator,
      onSaved: (data) {
        password = data;
      },
    );
  }

  Widget loginBtn(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 55,
      buttonColor: Colors.black,
      child: RaisedButton(
        onPressed: () async {
          StudentProvider prov =
              Provider.of<StudentProvider>(context, listen: false);
          if (formkey.currentState.validate()) {
            formkey.currentState.save();
            setState(() {
              clickedBool = true;
            });

            UserLogin log = UserLogin(email: email, password: password);
            var data = await log.loginUser();
            print(data["first"]);
            if (data == null) {
              showSnackBarInternet();
            } else {
              if (data["invalid"]) {
                showSnackBar();
              } else if (data["first"]) {
                Navigator.of(context).pushNamed("/second/form");
              } else {
                if (data["logged"]) {
                  StudentInfo stu = StudentInfo.fromDatabase(
                    email: data["email"],
                    id: data["_id"]["\$oid"],
                    firstname: data["firstname"],
                    lastname: data["lastname"],
                    pic: data["pic"],
                    first: data["first"],
                    telephone: data["telephone"],
                    year: data["year"],
                    isLocal: data["isLocal"],
                  );
                  prov.setStudentInfo(stu);
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setBool("logged", true);
                  pref.setString("id", stu.id);
                  pref.setString("pic", stu.pic);
                  pref.setString("firstname", stu.firstname);
                  pref.setString("lastname", stu.lastname);
                  pref.setString("year", data["year"]);
                  pref.setString("email", data["email"]);
                  pref.setString(
                    "telephone",
                    data["telephone"],
                  );
                  Navigator.of(context).popAndPushNamed("/main/page");
                }
              }
            }
          }
          setState(() {
            clickedBool = false;
          });
          // Navigator.of(context).pushNamed("/main/page");
        },
        child: Text(
          "Login",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget signupLink() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/signup");
      },
      child: Text(
        "Don't have account, signup",
        style: TextStyle(color: Colors.blue),
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

  showSnackBar() {
    final snackbar = new SnackBar(
      duration: new Duration(seconds: 2),
      content: Text(
        "Email or password wrong",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }

  showSnackBarInternet() {
    final snackbar = new SnackBar(
      duration: new Duration(seconds: 2),
      content: Text(
        "Please check your internet",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }
}
