import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test_app/Components/Calendar/DayButton.dart';

int numberOfWeeks(monthBeforeAmountDays, amountOfDaysThisMonth) {
  return monthBeforeAmountDays + amountOfDaysThisMonth <= 35 ? 5 : 6;
}

List mesSelect(type) {
  Color colorCont;
  Color cor;
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

class CalendarDayButtonGroup extends StatelessWidget {
  CalendarDayButtonGroup(
    this.selectedMonth,
    this.selectedYear,
  );

  final int selectedMonth;
  final int selectedYear;

  @override
  Widget build(BuildContext context) {
    List<String> arrayDiasSemana = ["D", "S", "T", "Q", "Q", "S", "S"];

    List<Widget> linhaDiasSemana = <Widget>[];
    List<Widget> lines = <Widget>[];
    List<Widget> rowgroup = <Widget>[];

    List<dynamic> arrayselectedMonthDias = [21, 24, 26]; // test values
    List<dynamic> arrayselectedMonthTypo = [1, 2, 3]; // test values

    Color cor = Color.fromRGBO(137, 169, 255, 1);
    FontWeight font = FontWeight.w600;
    Color colorCont = Colors.transparent;
    EdgeInsets small = EdgeInsets.fromLTRB(5, 5, 5, 5);

    String numeroParaMostrar;

    // DateTime now = DateTime.now();

    // ---------- obter primeiro dia e ultimo dia do mes selecionado ----------
    DateTime thisMonthFirstDay = new DateTime(selectedYear, selectedMonth, 1, 0, 0, 0, 0); //obter primeiro dia do mes ATUAL
    DateTime lastday = new DateTime(selectedYear, selectedMonth + 1, 0, 0, 0, 0, 0); //obter ultimo dia do mes ATUAL

    // ---------- obter primeiro dia do ultimo mes formulas ----------
    DateTime monthBeforeStartDay = thisMonthFirstDay.subtract(Duration(days: thisMonthFirstDay.weekday)).add(new Duration(hours: 1));
    int monthBeforeAmountDays = thisMonthFirstDay.difference(monthBeforeStartDay).inDays + 1;
    String firstdayFormated = DateFormat.d().format(monthBeforeStartDay);

    // ---------- obter primeiro dia deste mes formulas ----------
    int amountOfDaysThisMonth = lastday.difference(thisMonthFirstDay).inDays + 1;

    // ---------- Adicionar Linha com os dias da semana ----------
    arrayDiasSemana.forEach((dia) {
      linhaDiasSemana.add(Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        margin: small,
        height: 20,
        width: 20,
        child: Text(
          dia,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(232, 102, 0, 1),
              fontSize: 14,
            ),
          ),
        ),
      ));
    });

    rowgroup.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: linhaDiasSemana,
    ));

    //valores para saber quando o mes começa e acaba
    int mesTaped;
    int contadorNumerosDoUltimoMes = 1;
    int contadorNumeroDoMesAtual = 1;
    int contadorDiasMesAnterior = int.tryParse(firstdayFormated);
    int numeroDeColunas = numberOfWeeks(monthBeforeAmountDays, amountOfDaysThisMonth);
    for (int e = 1; e <= numeroDeColunas; e++) {
      lines = <Widget>[];
      for (int i = 0; i < 7; i++) {
        if ((e == 1 && i < monthBeforeAmountDays) || (e >= numeroDeColunas && contadorNumeroDoMesAtual > amountOfDaysThisMonth)) {
          if (e == 1) {
            numeroParaMostrar = contadorDiasMesAnterior.toString();
            mesTaped = selectedMonth - 1;
            contadorDiasMesAnterior++;
            cor = Colors.black;
            font = FontWeight.w400;
          } else {
            numeroParaMostrar = contadorNumerosDoUltimoMes.toString();
            contadorNumerosDoUltimoMes++;
            mesTaped = selectedMonth + 1;
            cor = Colors.black;
            font = FontWeight.w400;
          }
        } else {
          numeroParaMostrar = contadorNumeroDoMesAtual.toString();
          contadorNumeroDoMesAtual++;
          mesTaped = selectedMonth;
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

        // lines.add(calendarDayButton(context, colorCont: colorCont, cor: cor, font: font, numeroParaMostrar: numeroParaMostrar, small: small));
        lines.add(CalendarDayButton(colorCont, cor, font, small, numeroParaMostrar, selectedMonth, selectedYear, mesTaped, selectedYear));
      }

      rowgroup.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: lines,
      ));
    }

    return Column(
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
    );
  }
}
