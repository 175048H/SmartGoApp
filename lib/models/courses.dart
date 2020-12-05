class Courses {
  String courseno;
  String coursename;

  Courses(this.courseno, this.coursename);
  Courses.fromjson(dynamic f) {
    courseno = f['courseno'].toString();
    coursename = f['coursename'].toString();
  }
}
