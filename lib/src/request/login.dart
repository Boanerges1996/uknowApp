import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skulman/env.dart';

class UserLogin {
  String email;
  String password;
  UserLogin({this.email, this.password});

  Future loginUser() async {
    try {
      var data = await http.post(
        ENV == "dev" ? url[0] + "/user/login" : url[1] + "/user/login",
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }
}
