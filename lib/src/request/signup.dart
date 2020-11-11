import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skulman/env.dart';

class SignupUser {
  String email;
  String number;
  String password;
  SignupUser({this.email, this.number, this.password});

  Future signup() async {
    try {
      var data = await http.post(
        ENV == "dev" ? url[0] + "/user/signup" : url[0] + "/user/signup",
        body: json.encode(
          {
            "email": email,
            "telephone": number,
            "password": password,
          },
        ),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      print(json.decode(data.body));
      return json.decode(data.body);
    } catch (err) {
      print(err);
    }
  }
}
