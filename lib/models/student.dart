class Student {
  String _username;
  String _userpassword;
  String _firstname;
  String _lastname;
  String _useraddress;
  String _contactno;
  String _email;
  String _nic;
  String _courseno;

  Student(
      this._username,
      this._userpassword,
      this._firstname,
      this._lastname,
      this._useraddress,
      this._contactno,
      this._email,
      this._nic,
      this._courseno);

  String get username => _username;
  String get userpassword => _userpassword;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get useraddress => _useraddress;
  String get contactno => _contactno;
  String get email => _email;
  String get nic => _nic;
  String get courseno => _courseno;

  set username(String newUsername) {
    _username = newUsername;
  }

  set password(String newPassword) {
    _userpassword = newPassword;
  }

  set firstname(String newFirstname) {
    _firstname = newFirstname;
  }

  set lastname(String newLastname) {
    _lastname = newLastname;
  }

  set address(String newAddress) {
    _useraddress = newAddress;
  }

  set contactno(String newContactno) {
    _contactno = newContactno;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set nic(String newNic) {
    _nic = newNic;
  }

  set courseno(String newCourseno) {
    _courseno = newCourseno;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["username"] = _username;
    map["userpassword"] = _userpassword;
    map["firstname"] = _firstname;
    map["lastname"] = _lastname;
    map["useraddress"] = _useraddress;
    map["contactno"] = _contactno;
    map["email"] = _email;
    map["nic"] = _nic;
    map["courseno"] = _courseno;

    if (_username != null) {
      map["username"] = _username;
    }
    return map;
  }

  Student.fromObject(dynamic o) {
    this._username = o["username"];
    this._userpassword = o["passowrds"];
    this._firstname = o["firstname"];
    this._lastname = o["lastname"];
    this._useraddress = o["useraddress"];
    this._contactno = o["contactno"];
    this._email = o["email"];
    this._nic = o["nic"];
    this._courseno = o["courseno"];
  }
}
