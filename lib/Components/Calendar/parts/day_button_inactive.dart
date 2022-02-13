import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarDayButtonInactive extends StatelessWidget {
  final String dia;
  final EdgeInsets small;

  const CalendarDayButtonInactive(this.dia, this.small, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          textStyle: const TextStyle(fontWeight: FontWeight.w600, color: Color.fromRGBO(232, 102, 0, 1), fontSize: 14),
        ),
      ),
    );
  }
}
