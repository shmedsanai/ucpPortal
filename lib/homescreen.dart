import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucpportal/calculator.dart';

import 'Constants.dart';

import 'package:ucpportal/main.dart';

class YourApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('UCP PORTAL'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.transparent),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              'Dashboard',
            ),
          ),
          leading: Icon(Icons.menu_outlined),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.verified_user_outlined,
                  size: 33.0,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.battery_full, size: 33.0),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: PopupMenuButton<String>(
                  onSelected: (choice) => PopupSelection(choice, context),
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  }),
            ),
          ],
        ),
        body: Container(
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
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 10000.0,
                height: 78.0,
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(2.0),
                        margin: EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0, left: 6.0),
                          child: Text(
                            'Timetable',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(2.0),
                              constraints: BoxConstraints.expand(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11.0, left: 6.0),
                                child: Text(
                                  'Attendance',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.5),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(2.0),
                              constraints: BoxConstraints.expand(),
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11.0, left: 6.0),
                                child: Text(
                                  'Gradebook',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(2.0),
                        constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0, left: 6.0),
                          child: Text(
                            'Fee',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(2.0),
                        constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0, left: 6.0),
                          child: Text(
                            'Transcript',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CalculatorButton(),
              SizedBox(width: 1000, height: 10.0)
            ],
          ),
        ),
      ),
    );
  }

  void PopupSelection(String choice, BuildContext context) async {
    if (choice.contains('Logout')) {
      //FUNCTIONALITY OF LOGGING OUT
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    }
    if (choice.contains('Rate us')) {
//FUNCTIONALITY
    }
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          print('he');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Calculator()),
          );
        },
        child: Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(2.0),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 6.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'CGPA Calculator',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 130.0),
                    child: Icon(Icons.calculate),
                  ),
                ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
