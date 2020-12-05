import 'dart:convert';
import 'package:SmartGoApp/models/api.services.dart';
import 'package:flutter/material.dart';
import 'models/courses.dart';
import 'models/student.dart';
import 'package:http/http.dart' as http;
//import 'package:email_validator/email_validator.dart';

class SignupScreen extends StatefulWidget {
  final Student student;
  SignupScreen(this.student);

  @override
  _SignupScreenState createState() => _SignupScreenState(student);
}

class _SignupScreenState extends State<SignupScreen> {
  Student student;
  _SignupScreenState(this.student);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final addressController = TextEditingController();
  final contactnoController = TextEditingController();
  final emailController = TextEditingController();
  final nicController = TextEditingController();

  /* String _username;
  String _password;
  String _firstname;
  String _lastname;
  String _address;
  String _contactno;
  String _email;
  String _nic;*/
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> valform = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  //get course list from api

  // String _courseSelection;
  final String url = 'https://3a6593128d37.ngrok.io/api/Courses/';
  // List data = List();
  List<Courses> data = [];
  Future<String> getCourseList() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data = (resBody as List).map((e) => Courses.fromjson(e)).toList();
    });

    print(resBody);

    return "Sucess";
  }

  Courses itm;

  @override
  void initState() {
    super.initState();
    this.getCourseList();
  }

  @override
  Widget build(BuildContext context) {
    usernameController.text = student.username;
    passwordController.text = student.userpassword;
    firstnameController.text = student.firstname;
    lastnameController.text = student.lastname;
    addressController.text = student.useraddress;
    contactnoController.text = student.contactno;
    emailController.text = student.email;
    nicController.text = student.nic;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: valform,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BackButtoWidget(),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: () {}),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 4.0, right: 20.0),
                        child: TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Username',
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter Username';
                            }
                            return null;
                          },
                          onChanged: (value) => updateusername(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.lock), onPressed: () {}),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 4.0, right: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Password', labelText: 'Password'),
                          validator: (String value) {
                            if (value.isEmpty && value.length < 8) {
                              return 'Enter a password at least 8 characters';
                            }
                            return null;
                          },
                          autofocus: false,
                          obscureText: true,
                          controller: passwordController,
                          onChanged: (value) => updatepassword(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: () {}),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 20.0),
                          child: TextFormField(
                            controller: firstnameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              hintText: 'First Name',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter First Name';
                              }
                              return null;
                            },
                            onChanged: (value) => updatefirstname(),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: () {}),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 20.0),
                          child: TextFormField(
                            controller: lastnameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Last Name',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter Last Name';
                              }
                              return null;
                            },
                            onChanged: (value) => updatelastname(),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.home), onPressed: () {}),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 4.0, right: 20.0),
                        child: TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Address', hintText: 'Address'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter Address';
                            }
                            return null;
                          },
                          onChanged: (value) => updateaddress(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.call), onPressed: () {}),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 20.0),
                          child: TextFormField(
                            controller: contactnoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Contact No.',
                              hintText: 'Contact No.',
                            ),
                            onChanged: (value) => updatecontactno(),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.email), onPressed: () {}),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 20.0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Email ID',
                              hintText: 'Email ID',
                            ),
                            onChanged: (value) => updateemail(),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.credit_card), onPressed: () {}),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 20.0),
                          child: TextFormField(
                            controller: nicController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'NIC No.',
                              hintText: 'NIC No.',
                            ),
                            onChanged: (value) => updatenic(),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.library_books), onPressed: () {}),
                    Expanded(
                      child: Container(
                        child: DropdownButton(
                          value: itm,
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              child: Text(item.coursename),
                              value: item,
                            );
                          }).toList(),
                          hint: Text('Select a course'),
                          onChanged: (Courses newVal) {
                            setState(() {
                              itm = newVal;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.calendar_today), onPressed: () {}),
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                    SizedBox(width: 20.0),
                    Container(
                      child: RaisedButton(
                        color: Colors.black,
                        onPressed: () => _selectDate(context),
                        child: Text(
                          'Select Date of Birth',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'Home');
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                              colors: [Colors.teal, Colors.tealAccent])),
                      height: 60.0,
                      width: 350.0,
                      child: FlatButton(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          if (!valform.currentState.validate()) {
                            return;
                          }
                          signupStudent();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'SignIn');
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'SIGN IN',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signupStudent() async {
    var signupResponse = await APIServices.postStudent(student);
    print(signupResponse);
    Navigator.pushNamed(context, 'SignIn');
  }

  void updateusername() {
    student.username = usernameController.text;
  }

  void updatepassword() {
    student.password = passwordController.text;
  }

  void updatefirstname() {
    student.firstname = firstnameController.text;
  }

  void updatelastname() {
    student.lastname = lastnameController.text;
  }

  void updateaddress() {
    student.address = addressController.text;
  }

  void updatecontactno() {
    student.contactno = contactnoController.text;
  }

  void updateemail() {
    student.email = emailController.text;
  }

  void updatenic() {
    student.nic = nicController.text;
  }
}

class BackButtoWidget extends StatelessWidget {
  const BackButtoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
          80.0,
        )),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img2.jpg'),
        ),
      ),
      child: Positioned(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 30.0,
                right: 30.0,
                child: CircleAvatar(
                  backgroundColor: Colors.teal[800],
                  radius: 50.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/home.jpg'),
                    radius: 45.0,
                  ),
                )),
            Positioned(
              bottom: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Register Here',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
