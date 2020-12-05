import 'package:SmartGoApp/LoginLecturer.dart';
import 'package:SmartGoApp/dashboardLect.dart';
import 'package:SmartGoApp/profileLect.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawerLec extends StatefulWidget {
  @override
  _MainDrawerLecState createState() => _MainDrawerLecState();
}

class _MainDrawerLecState extends State<MainDrawerLec> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginLecturer()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('assets/home.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'Fathima Mafaza',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Text(
                  'mafazanfm@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30.0),
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.teal,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardLect()));
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.teal,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileLecture()));
          },
        ),
        ListTile(
          leading: Icon(Icons.power_settings_new),
          title: Text(
            'Logout',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 18.0,
            ),
          ),
          onTap: () {
            sharedPreferences.clear();

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginLecturer()),
                (Route<dynamic> route) => false);
          },
        )
      ],
    ));
  }
}
