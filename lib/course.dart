import 'package:SmartGoApp/models/courses.dart';
import 'package:flutter/material.dart';

import 'models/api.services.dart';

class Course extends StatefulWidget {
  final Courses courses;
  Course(this.courses);
  @override
  _CourseState createState() => _CourseState(courses);
}

class _CourseState extends State<Course> {
  String _coursename;
  String _courseno;

  Courses courses;
  _CourseState(this.courses);

  final coursenoController = TextEditingController();
  final coursenameController = TextEditingController();

  GlobalKey<FormState> valform = GlobalKey<FormState>();

  Widget _buildcourseno() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Course No.',
        hintText: 'Course No.',
      ),
      controller: coursenoController,
      onChanged: (value) => updatecourseno(),

      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter course number';
        }
      },
      onSaved: (String value) {
        _courseno = value;
      },
    );
  }

  Widget _buildcoursename() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Course Name',
        hintText: 'Course Name',
      ),
      controller: coursenameController,
      onChanged: (value) => updatecoursename(),

      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter course name';
        }
      },
      onSaved: (String value) {
        _coursename = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    coursenoController.text = courses.courseno;
    coursenameController.text = courses.coursename;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: valform,
        child: ListView(
          children: <Widget>[
            ImageContainer(),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: _buildcourseno(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: _buildcoursename(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft,
                          colors: [Colors.teal, Colors.tealAccent])),
                  height: 55.0,
                  child: FlatButton(
                    child: Text(
                      'CREATE',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      if (!valform.currentState.validate()) {
                        return;
                      }
                      signupCourse();
                      valform.currentState.save();
                      print(_courseno);
                      print(_coursename);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signupCourse() async {
    var signupResponse = await APIServices.postCourse(courses);
    print(signupResponse);
    Navigator.pop(context, true);
  }

  void updatecourseno() {
    courses.courseno = coursenoController.text;
  }

  void updatecoursename() {
    courses.coursename = coursenameController.text;
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
                        Navigator.pushNamed(context, 'CourseList');
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
              bottom: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Create Course Here',
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
