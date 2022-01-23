import 'package:flutter/material.dart';
import 'package:test_app/Components/Calendar/parts/MonthButton.dart';

class MonthButtonGroup extends StatefulWidget {
  final int mes;
  final int ano;
  final int selectedMonth;
  final int selectedYear;
  final Function notifyParent;

  MonthButtonGroup(
    this.mes,
    this.ano,
    this.selectedMonth,
    this.selectedYear,
    this.notifyParent,
  );
  @override
  _MonthButtonGroupState createState() => _MonthButtonGroupState();
}

class _MonthButtonGroupState extends State<MonthButtonGroup> {
  @override
  Widget build(BuildContext context) {
    List<Widget> grupoDeMeses = <Widget>[];
    var meslocal = widget.mes;
    var anolocal = widget.ano;

    for (var mesesParaMostrar = 0; mesesParaMostrar <= 12; mesesParaMostrar++) {
      grupoDeMeses.add(CalendarMonthButton(meslocal, anolocal, widget.selectedYear, widget.selectedMonth, widget.notifyParent));

      if (meslocal == 12) {
        meslocal = 1;
        anolocal++;
      } else {
        meslocal++;
      }
    }

    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: Colors.transparent,
      child: SingleChildScrollView(
        // controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Row(children: grupoDeMeses),
      ),
    );
  }
}
