import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        if (EmailValidator.validate(data)) {
          return null;
        } else
          return "Please enter a valid email address";
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
    );
  }

  Widget loginBtn(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 55,
      buttonColor: Colors.black,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/main/page");
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
}
