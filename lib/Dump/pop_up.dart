import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showBrevementeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
            children: const <TextSpan>[TextSpan(text: 'Selecionar pelo menos 1 dia!', style: TextStyle(fontSize: 15))],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
