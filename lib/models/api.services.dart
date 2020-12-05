import 'dart:convert';
import 'package:SmartGoApp/models/lecturer.dart';
import 'package:SmartGoApp/models/noteStudent.dart';
import 'package:SmartGoApp/models/student.dart';
import 'package:SmartGoApp/models/courses.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class APIServices {
  static String baseUrl = 'https://3a6593128d37.ngrok.io/api/';
  static String studentUrl = baseUrl + 'Students/';
  static String courseUrl = baseUrl + 'Courses/';
  static String lecturersUrl = baseUrl + 'Lectures/';

//get student details
  static Future fetchStudent() async {
    return await http.get(studentUrl);
  }

//get course details
  static Future fetchCourse() async {
    return await http.get(courseUrl);
  }

  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
//post student details
  static Future postStudent(Student student) async {
    Map<String, dynamic> tbody = {
      'Username': student.username,
      'UserPassword': student.userpassword,
      'Firstname': student.firstname,
      'Lastname': student.lastname,
      'UserAddress': student.useraddress,
      'Contactno': student.contactno,
      'email': student.email,
      'Email': student.nic,
      'Courseno': student.courseno
    };
    var body = json.encode(tbody);
    log(body);
    var res = await http.post(studentUrl, headers: header, body: body);
    return res;
  }

  //update student details

  static Future updateStudent(Student student) async {
    Map<String, dynamic> updatebody = {
      'Username': student.username,
      'UserPassword': student.userpassword,
      'Firstname': student.firstname,
      'Lastname': student.lastname,
      'UserAddress': student.useraddress,
      'Contactno': student.contactno,
      'email': student.email,
      'Email': student.nic,
      'Nic': student.nic,
      'Courseno': student.contactno
    };
    var usbody = json.encode(updatebody);
    log(usbody);
    var res = await http.put(studentUrl, headers: header, body: usbody);
    return res;
  }

  //get loggined Student details
  Future<NoteStudent> getAstudent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String username = sharedPreferences.getString('username');
    String currentstudentUrl = 'https://e664e6ba3df6.ngrok.io/api/Students/';
    final res = await http.get(currentstudentUrl + username, headers: header);

    if (res.statusCode == 200) {
      return NoteStudent.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load body');
    }
  }

  //post Lecturer details
  static Future postLecturers(Lecturer lecturer) async {
    Map<String, dynamic> tbody = {
      'Username': lecturer.username,
      'UserPassword': lecturer.userpassword,
      'Firstname': lecturer.firstname,
      'Lastname': lecturer.lastname,
      'UserAddress': lecturer.useraddress,
      'Contactno': lecturer.contactno,
      'email': lecturer.email,
      'Email': lecturer.nic,
      'Nic': lecturer.nic,
      'Courseno': lecturer.contactno
    };
    var body = json.encode(tbody);
    log(body);
    var res = await http.post(lecturersUrl, headers: header, body: body);
    return res;
  }

//post course details
  static Future postCourse(Courses course) async {
    Map<String, dynamic> coursebody = {
      'courseno': course.courseno,
      'coursename': course.coursename
    };
    var cbody = json.encode(coursebody);
    log(cbody);
    var res = await http.post(courseUrl, headers: header, body: cbody);
    return res;
  }

//delete course details
  static Future deleteCourse(String courseno) async {
    var res =
        await http.delete(courseUrl + courseno.toString(), headers: header);
    return res;
  }

  /*static Future<bool> postStudent(Student student) async {
    var myStudent = student.toMap();
    var studentBody = json.encode(myStudent);
    Map<String, dynamic> body = {
      'username': 'Mafaza',
      'passwords': 'Mafaza1235',
      'firstname': 'fathima',
      'lastname': 'nazaar',
      'addres': 'maligaikadu',
      'contactno': '0765564880',
      'email': 'mafaza@gmail.com',
      'nic': '977312752v',
      'cid': 2
    };
    var res = await http.post(studentUrl, headers: header, body: body);
    return Future.value(res.statusCode == 200 ? true : false);
  }*/
}
