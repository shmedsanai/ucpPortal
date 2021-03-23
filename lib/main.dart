import 'package:flutter/material.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucpportal/homescreen.dart';

import 'package:get/get.dart';
 
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.menu_outlined,
              size: 33.0,
            ),
            onPressed: () {},
          ),
        ),
        body: Center(child: _containerShape()),
      ),
    );
  }
}

class _containerShape extends StatefulWidget {
  const _containerShape({
    Key key,
  }) : super(key: key);

  @override
  __containerShapeState createState() => __containerShapeState();
}

class __containerShapeState extends State<_containerShape> {
  String registeration, password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.42,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple[200],
                  Colors.red[200],
                  Colors.red[300],
                ],
              ),
            ),
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 128.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/d/de/UCP_Logo_Pk.jpg',
                        scale: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 60.0, right: 60.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                registeration = value;
              });
            },
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Student ID'),
          ),
        ),

        /////////////////////
        ///
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 60.0, right: 60.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Password'),
          ),
        ),

        /////////////////
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: FlatButton(
            onPressed: () async {
              try {
                if (await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: registeration + "@ucp.edu.pk",
                        password: password) !=
                    null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourApp(),
                    ),
                  );

                 // Get.to(YourApp());
                }
              } catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            },
            child: Text('Login'),
            color: Colors.red,
            minWidth: 300,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
