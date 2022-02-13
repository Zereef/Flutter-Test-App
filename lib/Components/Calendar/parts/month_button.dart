import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// funções Do Seletor de meses
String mesDysplayName(mes) {
  String mesDysplay = "";
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
  return mesDysplay;
}

class CalendarMonthButton extends StatefulWidget {
  final int mes;
  final int ano;
  final int selectedYear;
  final int selectedMonth;
  final Function notifyParent;

  const CalendarMonthButton(this.mes, this.ano, this.selectedYear, this.selectedMonth, this.notifyParent, {Key? key}) : super(key: key);

  @override
  _CalendarMonthButtonState createState() => _CalendarMonthButtonState();
}

class _CalendarMonthButtonState extends State<CalendarMonthButton> {
  @override
  Widget build(BuildContext context) {
    String mesDysplay = "1";
    mesDysplay = mesDysplayName(widget.mes);
    if (widget.mes == widget.selectedMonth && widget.ano == widget.selectedYear) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(23.0)),
        ),
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
        child: Text(
          mesDysplay + ", " + widget.ano.toString(),
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(246, 146, 32, 1),
              fontSize: 16,
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          widget.notifyParent(widget.mes, widget.ano);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(23.0)),
          ),
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
          child: Text(
            mesDysplay,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(137, 169, 255, 1),
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }
  }
}
