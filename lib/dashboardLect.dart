import 'dart:convert';

import 'package:SmartGoApp/DrawerLecture.dart';
import 'package:SmartGoApp/models/api.services.dart';
import 'package:SmartGoApp/models/student.dart';
import 'package:flutter/material.dart';

class DashboardLect extends StatefulWidget {
  DashboardLect({Key key}) : super(key: key);
  @override
  _DashboardLectState createState() => _DashboardLectState();
}

/*
String name;

getname(){
  ...
  ...
  name = fname;
}


*/

class _DashboardLectState extends State<DashboardLect> {
  List<Student> students;
  getStudent() {
    APIServices.fetchStudent().then((response) {
      Iterable list = json.decode(response.body);
      List<Student> studentList = List<Student>();
      studentList = list.map((model) => Student.fromObject(model)).toList();

      setState(() {
        students = studentList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getStudent();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
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
      drawer: MainDrawerLec(),
      backgroundColor: Colors.teal,
      body: students == null
          ? Center(
              child: Text(
              'Please Wait......',
              style: TextStyle(
                  fontSize: 25.0, letterSpacing: 2.0, color: Colors.white),
            ))
          : Container(
              height: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.centerLeft,
                                end: FractionalOffset.centerRight,
                                colors: [
                              Colors.teal[200],
                              Colors.tealAccent[200]
                            ])),
                        height: 55.0,
                        width: 300.0,
                        child: FlatButton(
                          child: Text(
                            'COURSES',
                            style: TextStyle(
                              color: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Student List',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: _buildstudentlist()),
                ],
              )),
    );
  }

  Widget _buildstudentlist() {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: ListTile(
                title: Text(
                    students[index].firstname + ' ' + students[index].lastname),
                onTap: null,
              ),
            ),
          );
        });
  }
}
