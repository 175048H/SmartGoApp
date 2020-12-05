import 'package:flutter/material.dart';

class MainButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ImageContainer(),
        SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      colors: [Colors.teal, Colors.tealAccent])),
              height: 55.0,
              width: 300.0,
              child: FlatButton(
                child: Text(
                  'STUDENT',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'SignIn');
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.centerRight,
                      end: FractionalOffset.centerLeft,
                      colors: [Colors.teal, Colors.tealAccent])),
              height: 55.0,
              width: 300.0,
              child: FlatButton(
                child: Text(
                  'LECTURER',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'LoginLecturer');
                },
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(30),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           gradient: LinearGradient(
        //               begin: FractionalOffset.centerLeft,
        //               end: FractionalOffset.centerRight,
        //               colors: [Colors.teal, Colors.tealAccent])),
        //       height: 55.0,
        //       width: 300.0,
        //       child: FlatButton(
        //         child: Text(
        //           'COURSES',
        //           style: TextStyle(
        //             color: Colors.white,
        //             letterSpacing: 1.0,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20.0,
        //           ),
        //         ),
        //         onPressed: () {
        //           Navigator.pushNamed(context, 'CourseList');
        //         },
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(
                50.0,
              )),
          gradient: LinearGradient(
            begin: FractionalOffset.centerRight,
            end: FractionalOffset.centerLeft,
            colors: [Colors.teal, Colors.tealAccent],
          )),
      child: Positioned(
        child: Stack(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.teal[800],
                radius: 90.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/home.jpg'),
                  radius: 85.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
