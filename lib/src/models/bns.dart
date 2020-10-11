import 'dart:ffi';

class BNSModel {
  String name;
  String description;
  String price;
  String contact;
  String type;
  String email;
  String img;
  BNSModel(
      {this.contact,
      this.description,
      this.email,
      this.img,
      this.name,
      this.price,
      this.type});
}
