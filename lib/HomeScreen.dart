import 'package:SmartGoApp/menue.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 9);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainmenu()));
  }

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
                  radius: 90.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/home.jpg'),
                    radius: 85.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
