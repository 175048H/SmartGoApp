import 'dart:convert';
import 'package:SmartGoApp/profileLect.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLecturer extends StatefulWidget {
  @override
  _LoginLecturerState createState() => _LoginLecturerState();
}

class _LoginLecturerState extends State<LoginLecturer> {
  GlobalKey<FormState> valform = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  signIn(String username, String password) async {
    var data = jsonEncode({'Username': username, 'UserPassword': password});
    print(data);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
        'https://e664e6ba3df6.ngrok.io/api/LoginStu/LoginStudent',
        body: data,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    print(response.body);
    //var jsonData;

    if (response.statusCode == 200) {
      _isLoading = false;
      sharedPreferences.setString('token', response.body);
      sharedPreferences.setString('username', username);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => ProfileLecture()),
          (Route<dynamic> route) => false);
    } else {
      print(response.body);
    }
  }

  // if (response.statusCode == 200) {
  //   jsonData = jsonDecode(response.body);
  //   setState(() {
  //     _isLoading = false;
  //     sharedPreferences.setString("token", jsonData['token']);
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => DashboardStudent()),
  //         (Route<dynamic> route) => false);
  //   });
  // } else {
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: valform,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  ImageContainer(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.person), onPressed: () {}),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 4.0, right: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Username',
                              ),

                              // ignore: missing_return
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Username is required';
                                }
                              },
                              controller: usernameController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
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
                        child: FlatButton(
                          child: Text(
                            'SIGN IN',
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
                            setState(() {
                              _isLoading = true;
                            });

                            signIn(usernameController.text,
                                passwordController.text);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'SignupLecturer');
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'SIGN UP',
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
                ],
              ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
          80.0,
        )),
        image: DecorationImage(
          image: AssetImage('assets/img2.jpg'),
          fit: BoxFit.cover,
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
                        Navigator.pushNamed(context, 'Mainmenu');
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
                  radius: 60.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/home.jpg'),
                    radius: 55.0,
                  ),
                )),
            Positioned(
              bottom: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Login Here',
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
