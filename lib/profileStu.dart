import 'package:SmartGoApp/DrawerStudent.dart';
import 'package:SmartGoApp/models/api.services.dart';
import 'package:SmartGoApp/models/noteStudent.dart';
import 'package:flutter/material.dart';

class ProfileStudent extends StatefulWidget {
  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  Future<NoteStudent> _currentStudent;

  @override
  void initState() {
    super.initState();
    _currentStudent = APIServices().getAstudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawerStu(),
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
        body: Center(
          child: Text(_currentStudent.toString()),
        ));
  }
}
