

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucpportal/Constants.dart';
import 'package:ucpportal/main.dart';

import 'curren.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

var cgpaa = TextEditingController();
var crh = TextEditingController();

class _CalculatorState extends State<Calculator> {
  double ans = 0.00;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cgpaa.addListener(cg);
    crh.addListener(cg);
  }
Valus obj2,obj3,obj4,obj5,obj6,obj7;

  String dropdownValue = '';
  var _currencies = ['Grade','A','A-','B+','B','B-','C+','C','C-','D+','D','F'];
  var _currentItemSelected = 'Grade';

  String dropdownValue2 = '';
  var _currencies2 = ['Credit', '1', '2', '3', '4'];
  var _currentItemSelected2 = 'Credit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('CGPA Calculator'), backgroundColor: Colors.transparent,
        elevation: 0.0,
        //leading: Icon(Icons.arrow_back),
        actions: <Widget>[
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
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  width: 10000.0,
                  height: 100.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CGPA $ans',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            '/4.0',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'CURRENT CGPA',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: cgpaa,
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      maxLengthEnforced: true,
                                      cursorColor: Colors.transparent,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'TOTAL CREDIT HOURS',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: crh,
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      maxLengthEnforced: true,
                                      cursorColor: Colors.transparent,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),

                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ), Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(focusColor: Colors.transparent,
                                  dropdownColor: Colors.black,
                                  items: _currencies
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                              SizedBox(width: 20.0,),
///////////////////////////////////////////////////////////
                              Expanded(
                                flex: 2,
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  items: _currencies2
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    setState(() {
                                      this._currentItemSelected2 =
                                          newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected2,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                                child: Text(
                                  'Calculate',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  cg() {
    double cc = double.parse(cgpaa.text);
    if (cc > 4.00) {
      print('ln');
      cgpaa.clear();

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('CGPA should be less than 4.0',
              style: TextStyle(color: Colors.white)),
          elevation: 24.0,
        ),
      );
    }
    ;

    int cr = int.parse(crh.text);
    if (cr > 150) {
      print('fef');
      crh.clear();
    }
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
