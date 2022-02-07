import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'DayButton_Active.dart';
import 'DayButton_Inactive.dart';

List mesSelect(type) {
  Color colorCont = Color.fromRGBO(0, 0, 0, 0);
  Color cor = Color.fromRGBO(0, 0, 0, 0);
  switch (type) {
    case 1: //teleconsulta
      {
        cor = Color.fromRGBO(255, 255, 255, 1);
        colorCont = Color.fromRGBO(137, 169, 255, 1);
      }
      break;
    case 2: //Normal
      {
        cor = Color.fromRGBO(255, 255, 255, 1);
        colorCont = Color.fromRGBO(183, 67, 52, 1);
      }
      break;
    case 3: //a aguardar
      {
        cor = Color.fromRGBO(255, 255, 255, 1);
        colorCont = Color.fromRGBO(180, 180, 180, 1);
      }
      break;
  }
  return [cor, colorCont];
}

Widget firstline(small, dia) {
  return Container(
    color: Colors.transparent,
    alignment: Alignment.center,
    margin: small,
    height: 20,
    width: 20,
    child: Text(
      dia,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(fontWeight: FontWeight.w600, color: Color.fromRGBO(232, 102, 0, 1), fontSize: 14),
      ),
    ),
  );
}

class CalendarDayButtonGroup extends StatefulWidget {
  final int selectedMonth;
  final int selectedYear;
  final Function notifyParent;

  CalendarDayButtonGroup(
    this.selectedMonth,
    this.selectedYear,
    this.notifyParent,
  );

  @override
  State<CalendarDayButtonGroup> createState() => _CalendarDayButtonGroupState();
}

class _CalendarDayButtonGroupState extends State<CalendarDayButtonGroup> {
  @override
  Widget build(BuildContext context) {
    const List<String> arrayDiasSemana = ["D", "S", "T", "Q", "Q", "S", "S"]; // variavel dia + serve de contador
    const int numeroDeColunas = 6; // quantas colunas vai ter o calendario

    List<Widget> linesWithWeekDays = <Widget>[]; // line with the "arrayDiasSemana" days
    List<Widget> linesWeekDaysCalculated = <Widget>[]; //
    List<Widget> rowgroup = <Widget>[];
    String numeroParaMostrar;

    //test vars (WIP)
    List<dynamic> arrayselectedMonthDias = [21, 24, 26]; // test values
    List<dynamic> arrayselectedMonthTypo = [1, 2, 3]; // test values

    //Cores dos dias (WIP)
    Color cor = Color.fromRGBO(137, 169, 255, 1);
    FontWeight font = FontWeight.w600;
    Color colorCont = Colors.transparent;
    EdgeInsets small = EdgeInsets.fromLTRB(5, 5, 5, 5);

    //MES ATUAL FORMULAS
    int amountOfDaysThisMonth = DateTime(widget.selectedYear, widget.selectedMonth + 1, 0, 0, 0, 0, 0).day; //numero de dias
    DateTime thisMonthFirstDay = new DateTime(widget.selectedYear, widget.selectedMonth, 1, 0, 0, 0, 0); //obter primeiro

    //MES ANTERIOR FORMULAS
    DateTime monthBeforeStartDay = thisMonthFirstDay.subtract(Duration(days: thisMonthFirstDay.weekday)).add(new Duration(hours: 1)); // primeiro dia da semana a mostrar
    int firstdayFormated = int.tryParse(DateFormat.d().format(monthBeforeStartDay))!; //primeiro dia que aparece no calendario
    int monthBeforeAmountDays = thisMonthFirstDay.difference(monthBeforeStartDay).inDays + 1; //calcula quantos dias vão aparecer do mes anterior
    monthBeforeAmountDays == 7 ? monthBeforeAmountDays = 0 : monthBeforeAmountDays = monthBeforeAmountDays; //numero de dias antes n pode ser mais do que 7

    // ---------- Adicionar Linha com os dias da semana ----------
    arrayDiasSemana.forEach((dia) {
      linesWithWeekDays.add(CalendarDayButtonInactive(dia, small));
    });

    rowgroup.add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: linesWithWeekDays));

    //valores para saber quando o mes começa e acaba
    int mesTaped;
    int contadorNumerosDoUltimoMes = 1;
    int contadorNumeroDoMesAtual = 1;

    for (int e = 1; e <= numeroDeColunas; e++) {
      linesWeekDaysCalculated = <Widget>[];
      for (int i = 0; i < arrayDiasSemana.length; i++) {
        if ((e == 1 && i < monthBeforeAmountDays) || (contadorNumeroDoMesAtual > amountOfDaysThisMonth)) {
          switch (e) {
            case 1:
              numeroParaMostrar = firstdayFormated.toString();
              mesTaped = widget.selectedMonth - 1;
              firstdayFormated++;
              cor = Colors.black;
              font = FontWeight.w400;
              break;
            default:
              numeroParaMostrar = contadorNumerosDoUltimoMes.toString();
              contadorNumerosDoUltimoMes++;
              mesTaped = widget.selectedMonth + 1;
              cor = Colors.black;
              font = FontWeight.w400;
              break;
          }
        } else {
          numeroParaMostrar = contadorNumeroDoMesAtual.toString();
          contadorNumeroDoMesAtual++;
          mesTaped = widget.selectedMonth;
          cor = Colors.greenAccent;
          font = FontWeight.w400;
          if (arrayselectedMonthDias.contains(contadorNumeroDoMesAtual - 1)) {
            var posicao = arrayselectedMonthDias.indexOf(contadorNumeroDoMesAtual - 1);
            var type = arrayselectedMonthTypo[posicao];
            List received = mesSelect(type);
            cor = received[0];
            colorCont = received[1];
          } else {
            colorCont = Colors.transparent;
          }
        }
        linesWeekDaysCalculated.add(CalendarDayActiveButton(colorCont, cor, font, small, numeroParaMostrar, widget.selectedMonth, widget.selectedYear, mesTaped, widget.selectedYear));
      }
      rowgroup.add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: linesWeekDaysCalculated));
    }

    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          widget.notifyParent(widget.selectedMonth, widget.selectedYear, "+"); //goes back a month
        } else if (details.primaryVelocity! < 0) {
          widget.notifyParent(widget.selectedMonth, widget.selectedYear, "-"); //goes foward a month
        }
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(const Radius.circular(23.0)),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: rowgroup,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
