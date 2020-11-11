class StudentInfo {
  String firstname;
  String lastname;
  String email;
  String pic;
  bool logged;
  bool isLocal;
  String telephone;
  String id;
  String year;
  bool first;
  StudentInfo() {
    firstname = "";
    lastname = "";
    email = "";
    pic = "";
    logged = false;
    isLocal = false;
    id = "";
    telephone = "";
    year = "";
  }

  StudentInfo.fromDatabase(
      {this.email,
      this.firstname,
      this.id,
      this.isLocal,
      this.lastname,
      this.logged,
      this.pic,
      this.telephone,
      this.year,
      this.first});
}
