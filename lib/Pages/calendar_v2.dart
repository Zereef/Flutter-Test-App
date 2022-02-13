//main dart and flutter imports
import 'package:flutter/material.dart';

//costum import
import 'package:test_app/Components/Calendar/calendar.dart';
import 'package:test_app/Components/runtime_variables.dart';

class CalendarShow2 extends StatelessWidget {
  const CalendarShow2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            height: Common.height,
            padding: const EdgeInsets.all(0.0),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
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
