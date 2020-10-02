import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:email_validator/email_validator.dart' as E;
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  bool clickedSignup = false;
  final paswordValidator = MultiValidator(
    [
      RequiredValidator(errorText: "Password Require"),
      MinLengthValidator(8, errorText: "Minimum length of 8"),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'passwords must have at least one special character')
    ],
  );
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
              children: [
                skulMan(context),
                SizedBox(
                  height: 20,
                ),
                emailWig(context),
                SizedBox(
                  height: 10,
                ),
                numberWig(context),
                SizedBox(
                  height: 10,
                ),
                passwordWig(context),
                SizedBox(
                  height: 10,
                ),
                signupBtn(context),
                SizedBox(
                  height: 10,
                ),
                loginLink(),
                SizedBox(
                  height: 10,
                ),
                (clickedSignup == true ? loadingBtn() : Text(""))
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget skulMan(context) {
    return Text(
      "Skulman \n  Signup",
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
        errorStyle: TextStyle(color: Colors.white),
      ),
      validator: (data) {
        if (E.EmailValidator.validate(data)) {
          return null;
        } else
          return "Please enter a valid email address";
      },
    );
  }

  Widget numberWig(context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Telephone",
        hintText: "8264174451",
        errorStyle: TextStyle(color: Colors.white),
      ),
      validator: (data) {
        if (data.length < 10) {
          return "Number should be 10 characters";
        } else
          return null;
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
        errorStyle: TextStyle(color: Colors.white),
      ),
      validator: paswordValidator,
    );
  }

  Widget signupBtn(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 55,
      buttonColor: Colors.black,
      child: RaisedButton(
        onPressed: () {
          if (formkey.currentState.validate()) {
            setState(() {
              clickedSignup = true;
            });
          }
        },
        child: Text(
          "Signup",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget loginLink() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/login");
      },
      child: Text(
        "Already have account, Login",
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
