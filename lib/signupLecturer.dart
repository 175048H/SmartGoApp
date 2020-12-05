import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/api.services.dart';
import 'models/lecturer.dart';

class SignupLecturer extends StatefulWidget {
  final Lecturer lecturer;
  SignupLecturer(this.lecturer);
  @override
  _SignupLecturerState createState() => _SignupLecturerState(lecturer);
}

class _SignupLecturerState extends State<SignupLecturer> {
  Lecturer lecturer;
  _SignupLecturerState(this.lecturer);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final addressController = TextEditingController();
  final contactnoController = TextEditingController();
  final emailController = TextEditingController();
  final nicController = TextEditingController();

  GlobalKey<FormState> valform = GlobalKey<FormState>();

  //get course list from api

  String _courseSelection;
  final String url = 'https://3a6593128d37.ngrok.io/api/Courses/';
  List data = List();
  Future<String> getCourseList() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    this.getCourseList();
  }

  @override
  Widget build(BuildContext context) {
    usernameController.text = lecturer.username;
    passwordController.text = lecturer.userpassword;
    firstnameController.text = lecturer.firstname;
    lastnameController.text = lecturer.lastname;
    addressController.text = lecturer.useraddress;
    contactnoController.text = lecturer.contactno;
    emailController.text = lecturer.email;
    nicController.text = lecturer.nic;
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
                          },
                          autofocus: false,
                          obscureText: true,
                          controller: passwordController,
                          onChanged: (value) => updatepassword(),
                        ),
                        /* child: PasswordField(
                            controller: passwordController,
                            hintText: 'Password',
                            errorMessage:
                                'Please enter a password that is at least 8 characters long and contains at least one capital letter, small letter, symbol and one number',
                            pattern:
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                            // ignore: deprecated_member_use
                            onChanged: (value) => updatepassword(),
                          )*/
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
                            validator: (String value) {
                              Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regex = new RegExp(pattern);
                              if (value.isEmpty) {
                                return 'Please enter mobile number';
                              } else if (!regex.hasMatch(value)) {
                                return 'Please enter a valid mobile number';
                              }
                              return null;
                            },
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
                            validator: (String value) {
                              Pattern pattern =
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
                              RegExp regex = new RegExp(pattern);
                              if ((!regex.hasMatch(value))) {
                                return 'Enter valid email';
                              }
                            },
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
                    Container(
                      child: Expanded(
                        child: DropdownButton(
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['coursename']),
                              value: item['courseno'].toString(),
                            );
                          }).toList(),
                          hint: Text('Select a course'),
                          onChanged: (newVal) {
                            setState(() {
                              _courseSelection = newVal;
                            });
                          },
                          value: _courseSelection,
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
                          signupLecturer();
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

  void signupLecturer() async {
    var signupResponse = await APIServices.postLecturers(lecturer);
    print(signupResponse);
    Navigator.pop(context, true);
  }

  void updateusername() {
    lecturer.username = usernameController.text;
  }

  void updatepassword() {
    lecturer.password = passwordController.text;
  }

  void updatefirstname() {
    lecturer.firstname = firstnameController.text;
  }

  void updatelastname() {
    lecturer.lastname = lastnameController.text;
  }

  void updateaddress() {
    lecturer.address = addressController.text;
  }

  void updatecontactno() {
    lecturer.contactno = contactnoController.text;
  }

  void updateemail() {
    lecturer.email = emailController.text;
  }

  void updatenic() {
    lecturer.nic = nicController.text;
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
