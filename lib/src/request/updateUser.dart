import 'dart:convert';
// import 'dart:html';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skulman/env.dart';

class UpdateUser {
  String id;
  String firstname;
  String lastname;
  String year;
  bool isLocal;
  UpdateUser({this.id, this.firstname, this.isLocal, this.lastname, this.year});
  Future update() async {
    try {
      var info = await http.put(
        ENV == "dev"
            ? url[0] + "/user/meth/" + id
            : url[1] + "/user/meth/" + id,
        body: json.encode(
          {
            "firstname": firstname,
            "lastname": lastname,
            "isLocal": isLocal,
            "year": year,
            "first": false
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      print(json.decode(info.body));
      return json.decode(info.body);
    } catch (err) {
      print(err);
      return err;
    }
  }
}
