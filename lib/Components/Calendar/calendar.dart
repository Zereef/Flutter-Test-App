import 'package:flutter/material.dart';

import 'parts/day_button_group.dart';
import 'parts/month_buton_group.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime now = DateTime.now();
  bool firstrun = true;
  int mes = 1;
  int ano = 2021;
  int selectedMonth = 1; // VARIABLES FOR MONTH IN FOCUS
  int selectedYear = 2021;

  // UPDATES THE MONTH IN FOCUS
  void updateDate(int importMonth, int importYear) {
    setState(() {
      selectedMonth = importMonth;
      selectedYear = importYear;
    });
  }

  void changedTimeByScroll(int importMonth, int importYear, String state) {
    int internalMonth = importMonth;
    int internalYear = importYear;
    switch (state) {
      case "+":
        if (internalMonth == 1) {
          internalMonth = 12;
          internalYear--;
        } else {
          internalMonth--;
        }
        break;
      case "-":
        if (mes == 12) {
          internalMonth = 1;
          internalYear++;
        } else {
          internalMonth++;
        }
        break;
    }
    updateDate(internalMonth, internalYear);
  }

  //WIP
  // void goController(int distance) {
  //   setState(() {
  //     // _controller.jumpTo(89 + 90.0);
  //     // 89      // 90      // 101      // 95      // 107      // 130
  //     //// 118      // 135      // 134      // 109      // 124      // 100
  //     // _controller.animateTo(_controller.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.ease);
  //   });
  // }
  // ScrollController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = ScrollController();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _controller.animateTo(_controller.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.ease);
  //   });
  // }

  //
  @override
  Widget build(BuildContext context) {
    if (firstrun == true) {
      mes = int.tryParse(DateTime(now.month).toString().substring(0, 4))!;
      ano = int.tryParse(DateTime(now.year).toString().substring(0, 4))!;
      updateDate(mes, ano);
      firstrun = false;
    }
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MonthButtonGroup(mes, ano, selectedMonth, selectedYear, updateDate),
              CalendarDayButtonGroup(selectedMonth, selectedYear, changedTimeByScroll),
              Container(
                color: Colors.redAccent,
                child: Column(
                  children: [
                    Text('Mes selecionado: $selectedMonth'),
                    Text('Ano selecionado: $selectedYear'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
