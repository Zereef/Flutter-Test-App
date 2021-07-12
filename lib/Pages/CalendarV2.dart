//main dart and flutter imports
import 'package:flutter/material.dart';

//costum import
import 'package:test_app/Components/runtime_variables.dart';

import '../Components/Calendar/DayButtonGroup.dart';
import '../Components/Calendar/MonthButton.dart';

class Calendar2 extends StatelessWidget {
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
                CompleteCalendar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------
class CompleteCalendar extends StatefulWidget {
  @override
  _CompleteCalendarState createState() => _CompleteCalendarState();
}

class _CompleteCalendarState extends State<CompleteCalendar> {
  bool selectedSet = false;
  List<Widget> grupoDeMeses = <Widget>[];

  int mes;
  int ano;

  String mesDysplay;

  DateTime now = DateTime.now();

  // VARIABLES FOR MONTH IN FOCUS
  int selectedMonth;
  int selectedYear;

  // UPDATES THE MONTH IN FOCUS
  void selected(int mes, int ano) {
    setState(() {
      selectedMonth = mes;
      selectedYear = ano;
    });
  }

  //WIP: Controller Meses
  void goController(int distance) {
    setState(() {
      // _controller.jumpTo(89 + 90.0);
      // 89      // 90      // 101      // 95      // 107      // 130
      //// 118      // 135      // 134      // 109      // 124      // 100
      // _controller.animateTo(_controller.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.ease);
    });
  }

  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.animateTo(_controller.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.ease);
    });
  }

  //UPDATE FROM MONTH BUTTON TO UPDATE THE CURRENT MONTH
  refresh(mes, ano) {
    setState(() {
      selected(mes, ano);
      // var distance = 100;
      // goController(distance);
    });
  }

  // funções Do Seletor de meses
  void mesDysplayName(mes) {
    switch (mes) {
      case 1:
        {
          mesDysplay = "Janeiro";
        }
        break;
      case 2:
        {
          mesDysplay = "Fevereiro";
        }
        break;
      case 3:
        {
          mesDysplay = "Março";
        }
        break;
      case 4:
        {
          mesDysplay = "Abril";
        }
        break;
      case 5:
        {
          mesDysplay = "Maio";
        }
        break;
      case 6:
        {
          mesDysplay = "Junho";
        }
        break;
      case 7:
        {
          mesDysplay = "Julho";
        }
        break;
      case 8:
        {
          mesDysplay = "Agosto";
        }
        break;
      case 9:
        {
          mesDysplay = "Setembro";
        }
        break;
      case 10:
        {
          mesDysplay = "Outubro";
        }
        break;
      case 11:
        {
          mesDysplay = "Novembro";
        }
        break;
      case 12:
        {
          mesDysplay = "Dezembro";
        }
        break;
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    grupoDeMeses.clear();
    //
    mes = int.tryParse(DateTime(now.month).toString().substring(0, 4));
    ano = int.tryParse(DateTime(now.year).toString().substring(0, 4));

    if (selectedSet == false) {
      selected(mes, ano);
      selectedSet = true;
    }

    //
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mesList(),
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity > 0) {
                    //FIX: month is 1 change year - 1 and set month 12
                    selected(selectedMonth - 1, selectedYear);
                  } else if (details.primaryVelocity < 0) {
                    //FIX: month is 12 change year + 1 and set month 1
                    selected(selectedMonth + 1, selectedYear);
                  }
                },
                child: CalendarDayButtonGroup(selectedMonth, selectedYear),
              ),
              Container(
                color: Colors.redAccent,
                child: Column(
                  children: [
                    Text('Mes selecionado: $mes'),
                    Text('Ano selecionado: $ano'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //WIP: lista de meses para o "calendarMonthButton"+
  Widget mesList() {
    Container listaMeses;
    var meslocal = mes;
    var anolocal = ano;

    for (var mesesParaMostrar = 0; mesesParaMostrar <= 12; mesesParaMostrar++) {
      // grupoDeMeses.add(calendarMonthButton(context, mes: meslocal, ano: anolocal));
      grupoDeMeses.add(CalendarMonthButton(meslocal, anolocal, selectedYear, selectedMonth, refresh));

      if (meslocal == 12) {
        meslocal = 1;
        anolocal++;
      } else {
        meslocal++;
      }

      if (mesesParaMostrar == 12) {
        listaMeses = Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          color: Colors.transparent,
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(children: grupoDeMeses),
          ),
        );
      }
    }

    return listaMeses;
  }
}
