import 'package:flutter/material.dart';

class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal, Colors.tealAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.teal[800],
                  radius: 80.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/home.jpg'),
                    radius: 75.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    child: RaisedButton(
                      color: Colors.grey[200],
                      child: Text(
                        'STUDENT',
                        style: TextStyle(
                          color: Colors.teal,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'SignIn');
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    child: RaisedButton(
                      color: Colors.grey[200],
                      child: Text(
                        'LECTURER',
                        style: TextStyle(
                          color: Colors.teal,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'LoginLecturer');
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    child: RaisedButton(
                      color: Colors.grey[200],
                      child: Text(
                        'COURSES',
                        style: TextStyle(
                          color: Colors.teal,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'CourseList');
                      },
                    ),
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
