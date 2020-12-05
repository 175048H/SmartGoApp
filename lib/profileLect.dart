import 'package:flutter/material.dart';
import 'DrawerLecture.dart';

class ProfileLecture extends StatefulWidget {
  @override
  _ProfileLectureState createState() => _ProfileLectureState();
}

class _ProfileLectureState extends State<ProfileLecture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawerLec(),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25.0),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.teal,
                Colors.tealAccent,
              ],
            ),
          ),
        ),
      ),
      body: Row(),
    );
  }
}
