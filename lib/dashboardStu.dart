import 'package:SmartGoApp/DrawerStudent.dart';
import 'package:flutter/material.dart';

class DashboardStudent extends StatefulWidget {
  @override
  _DashboardStudentState createState() => _DashboardStudentState();
}

class _DashboardStudentState extends State<DashboardStudent> {
  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString("token") != null) {
  //     print("token");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (loading == true) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
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
        drawer: MainDrawerStu(),
        body: Center(
          child: Text('Welcome'),
        ));
  }
}
