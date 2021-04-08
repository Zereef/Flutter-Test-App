//main dart and flutter imports
import 'package:flutter/material.dart';
import 'dart:ui';

//packages
import 'package:intl/intl.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

//costum import
import 'package:test_app/runtime_variables.dart';

class MarcarConsulta extends StatelessWidget {
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
              color: Colors.blueGrey,
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
  List<Widget> grupoDeMeses = <Widget>[];
  int dia = 1;
  int mes;

  int ano;
  String mesDysplay;

  DateTime now = DateTime.now();
  int selectedMonth = 4;
  int selectedYear = 2021;

  // funções select month WIP
  void selected(int mes, int ano) {
    setState(() {
      selectedMonth = mes;
      selectedYear = ano;
    });
  }

  //WIP: Controller Meses
  void goController(int distance) {
    setState(() {
      _controller.jumpTo(89 + 90.0);
      // 89
      // 90
      // 101
      // 95
      // 107
      // 130
      // 118
      // 135
      // 134
      // 109
      // 124
      // 100

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
  //

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

  // funções Do calendarDayButtonGroup
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

  //
  @override
  Widget build(BuildContext context) {
    grupoDeMeses.clear();
    //
    mes = int.tryParse(DateTime(now.month).toString().substring(0, 4));
    ano = int.tryParse(DateTime(now.year).toString().substring(0, 4));
    //
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mesList(),
              calendarDayButtonGroup(),
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

  //////////////////////////////////////////////////////////////////
  //WIP: fully build Month Array
  Widget calendarMonthButton(BuildContext context, {int dia, int mes, int ano}) {
    mesDysplayName(mes);
    if (mes == selectedMonth && ano == selectedYear) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(23.0)),
        ),
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
        child: Text(
          mesDysplay + ", " + ano.toString(),
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
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
          // MarcacaoVariables.dia = dia;
          // MarcacaoVariables.mes = mes;
          // MarcacaoVariables.ano = ano;
          selected(mes, ano);
          var distance = 100;
          goController(distance);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(const Radius.circular(23.0)),
          ),
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
          child: Text(
            mesDysplay,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
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

  //WIP: lista de meses para o "calendarMonthButton"+
  Widget mesList() {
    Container listaMeses;

    for (var mesesParaMostrar = 0; mesesParaMostrar <= 12; mesesParaMostrar++) {
      grupoDeMeses.add(calendarMonthButton(context, dia: dia, mes: mes, ano: ano));

      if (mes == 12) {
        mes = 1;
        ano++;
      } else {
        mes++;
      }

      if (mesesParaMostrar == 12) {
        listaMeses = Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          color: Colors.deepPurpleAccent,
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

  //////////////////////////////////////////////////////////////////
  //WIP: fully build Day Array
  Widget calendarDayButtonGroup() {
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
    int contadorNumerosDoUltimoMes = 1;
    int contadorNumeroDoMesAtual = 1;
    int contadorDiasMesAnterior = int.tryParse(firstdayFormated);
    int numeroDeColunas = numberOfWeeks(monthBeforeAmountDays, amountOfDaysThisMonth);
    for (var e = 1; e <= numeroDeColunas; e++) {
      lines = <Widget>[];
      for (var i = 0; i < 7; i++) {
        if ((e == 1 && i < monthBeforeAmountDays) || (e >= numeroDeColunas && contadorNumeroDoMesAtual > amountOfDaysThisMonth)) {
          if (e == 1) {
            numeroParaMostrar = contadorDiasMesAnterior.toString();
            contadorDiasMesAnterior++;
            cor = Colors.black;
            font = FontWeight.w400;
          } else {
            numeroParaMostrar = contadorNumerosDoUltimoMes.toString();
            contadorNumerosDoUltimoMes++;
            cor = Colors.black;
            font = FontWeight.w400;
          }
        } else {
          numeroParaMostrar = contadorNumeroDoMesAtual.toString();
          contadorNumeroDoMesAtual++;
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

        lines.add(calendarDayButton(context, colorCont: colorCont, cor: cor, font: font, numeroParaMostrar: numeroParaMostrar, small: small));
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
          child: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.primaryVelocity > 0) {
                //FIX: month is 1 change year - 1 and set month 12
                selected(selectedMonth - 1, selectedYear);
              } else if (details.primaryVelocity < 0) {
                //FIX: month is 12 change year + 1 and set month 1
                selected(selectedMonth + 1, selectedYear);
              }
            },
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
        ),
      ],
    );
  }

  //WIP: Button of "calendarDayButtonGroup"
  Widget calendarDayButton(BuildContext context, {Color colorCont, Color cor, FontWeight font, String numeroParaMostrar, EdgeInsets small}) {
    return GestureDetector(
      onTap: () {
        calendarDayButtonDialog(context, numeroParaMostrar);
      },
      child: Container(
        alignment: Alignment.center,
        margin: small,
        decoration: BoxDecoration(
          color: colorCont,
          borderRadius: const BorderRadius.all(
            const Radius.circular(25.0),
          ),
        ),
        height: 28,
        width: 28,
        child: Text(
          numeroParaMostrar,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: font,
              color: cor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  //WIP: Dialog of "calendarDayButton"
  Future calendarDayButtonDialog(BuildContext context, String numeroParaMostrar) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aviso (WIP)"),
          content: Text("Qualquer mensagem pode aparecer aqui, qualquer coisa pode ser feita a clicar no dia" + numeroParaMostrar),
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
  }
}
