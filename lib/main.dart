import 'package:SmartGoApp/HomeScreen.dart';
import 'package:SmartGoApp/LoginLecturer.dart';
import 'package:SmartGoApp/LoginStudent.dart';
import 'package:SmartGoApp/MainButtons.dart';
import 'package:SmartGoApp/SignupStudent.dart';
import 'package:SmartGoApp/course.dart';
import 'package:SmartGoApp/menue.dart';
import 'package:SmartGoApp/models/courses.dart';
import 'package:SmartGoApp/models/student.dart';
import 'package:SmartGoApp/signupLecturer.dart';
import 'package:flutter/material.dart';
import 'courseList.dart';
import 'dashboardLect.dart';
import 'models/lecturer.dart';

void main() {
  runApp(MaterialApp(
    home: DashboardLect(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'Home',
      routes: {
        'SignIn': (context) => LoginStudent(),
        'SignUp': (context) =>
            SignupScreen(Student('', '', '', '', '', '', '', '', '')),
        'Home': (context) => HomeScreen(),
        'Course': (context) => Course(Courses('', '')),
        'Mainmenu': (context) => Mainmenu(),
        "LoginLecturer": (context) => LoginLecturer(),
        "SignupLecturer": (context) =>
            SignupLecturer(Lecturer('', '', '', '', '', '', '', '', '')),
        "CourseList": (context) => CourseList(),
        "buttons": (context) => MainButtons()
      },
    );
  }
}
