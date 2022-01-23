//main dart and flutter imports
import 'package:flutter/material.dart';

//costum import
import 'package:test_app/Components/Calendar/calendar.dart';
import 'package:test_app/Components/runtime_variables.dart';

class CalendarShow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            height: Common.height,
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Calendar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------
