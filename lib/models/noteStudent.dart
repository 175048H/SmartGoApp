class NoteStudent {
  String username;
  String userpassword;
  String firstname;
  String lastname;
  String useraddress;
  String contactno;
  String email;
  String nic;
  String courseno;

  NoteStudent(
      {this.username,
      this.userpassword,
      this.firstname,
      this.lastname,
      this.useraddress,
      this.contactno,
      this.email,
      this.nic,
      this.courseno});

  factory NoteStudent.fromJson(Map<String, dynamic> json) {
    return NoteStudent(
        username: json['username'],
        userpassword: json['userpassword'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        useraddress: json['useraddress'],
        contactno: json['contactno'],
        email: json['email'],
        nic: json['nic'],
        courseno: json['courseno']);
  }
}
