import 'dart:convert';
import 'package:SmartGoApp/course.dart';
import 'package:SmartGoApp/models/courses.dart';
import 'package:flutter/material.dart';
import 'models/api.services.dart';

class CourseList extends StatefulWidget {
  CourseList({Key key}) : super(key: key);
  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<Courses> courses;
  getCourses() {
    APIServices.fetchCourse().then((response) {
      Iterable list = json.decode(response.body);
      List<Courses> courseList = List<Courses>();
      courseList = list.map((model) => Courses.fromjson(model)).toList();

      setState(() {
        courses = courseList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getCourses();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Courses',
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
      floatingActionButton: _floatingButton(),
      backgroundColor: Colors.teal,
      body: courses == null
          ? Center(
              child: Text(
              'Please Wait......',
              style: TextStyle(
                  color: Colors.white, fontSize: 25.0, letterSpacing: 2.0),
            ))
          : _buildcourselist(),
    );
  }

  Widget _buildcourselist() {
    return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: ListTile(
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                title: Text(courses[index].courseno +
                    ' - ' +
                    courses[index].coursename),
              ),
              onTap: () {
                navigateToCourses(this.courses[index]);
              },
            ),
          );
        });
  }

  void deleteCourse(String courseno) async {
    var deleteCourse = await APIServices.deleteCourse(courseno);
    print(deleteCourse);
    Navigator.pop(context, true);
  }

  void navigateToCourses(Courses courses) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Course(courses)));
  }

  Widget _floatingButton() {
    return FloatingActionButton(
      child: Container(
        width: 55,
        height: 55,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Colors.tealAccent, Colors.teal])),
      ),
      onPressed: () {
        navigateToCourses(Courses('', ''));
      },
    );
  }
}
