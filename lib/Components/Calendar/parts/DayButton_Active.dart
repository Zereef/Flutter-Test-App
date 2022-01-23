import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarDayActiveButton extends StatelessWidget {
  final Color colorCont;
  final Color cor;
  final FontWeight font;
  final EdgeInsets small;
  final String numeroParaMostrar;
  final int selectedMonth;
  final int selectedYear;
  final int mesTaped;
  final int yearTaped;

  const CalendarDayActiveButton(
    this.colorCont,
    this.cor,
    this.font,
    this.small,
    this.numeroParaMostrar,
    this.selectedMonth,
    this.selectedYear,
    this.mesTaped,
    this.yearTaped,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Aviso (WIP)"),
              content:
                  Text("Qualquer mensagem pode aparecer aqui, qualquer coisa pode ser feita a clicar no dia: $numeroParaMostrar, $mesTaped, $selectedYear"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: small,
        decoration: BoxDecoration(
          color: colorCont,
          borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
        ),
        height: 28,
        width: 28,
        child: Text(
          numeroParaMostrar,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: font, color: cor, fontSize: 14)),
        ),
      ),
    );
  }
}
