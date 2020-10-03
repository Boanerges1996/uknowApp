import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class BNSForm extends StatefulWidget {
  @override
  _BNSFormState createState() => _BNSFormState();
}

class _BNSFormState extends State<BNSForm> {
  final formKey = GlobalKey<FormState>();

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              name(context),
              SizedBox(
                height: 10,
              ),
              price(context),
              SizedBox(
                height: 10,
              ),
              contactNumber(context),
              SizedBox(
                height: 10,
              ),
              content(context),
              SizedBox(
                height: 10,
              ),
              getImageBtn(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget name(context) {
    return TextFormField(
      cursorColor: Colors.pink,
      decoration: InputDecoration(
        hintText: "Product Name",
        labelText: "name",
        labelStyle: TextStyle(color: Colors.pink),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
      ),
    );
  }

  Widget price(context) {
    return TextFormField(
      cursorColor: Colors.pink,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "price",
        labelText: "Price",
        labelStyle: TextStyle(color: Colors.pink),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
      ),
    );
  }

  Widget contactNumber(context) {
    return TextFormField(
      cursorColor: Colors.pink,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.pink),
        hintText: "contact",
        labelText: "8264174451",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
      ),
    );
  }

  Widget content(context) {
    return TextFormField(
      cursorColor: Colors.pink,
      maxLength: 5,
      maxLines: 10,
      minLines: 5,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.pink),
        hintText: "Description",
        labelText: "description",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
      ),
    );
  }

  Widget getImageBtn(context) {
    return RaisedButton(
      onPressed: () {
        getImage();
      },
      child: Text("select image"),
    );
  }
}
