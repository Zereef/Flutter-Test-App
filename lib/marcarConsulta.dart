//main dart and flutter imports
import 'package:flutter/material.dart';
import 'dart:ui';

//packages
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

//costum import
import 'package:test_app/runtime_variables.dart';
import 'marcacaomodel.dart';

class MarcarConsulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BottomSpace(),
        ],
      ),
    );
  }
}

showBrevementeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
            children: <TextSpan>[TextSpan(text: 'Selecionar pelo menos 1 dia!', style: TextStyle(fontSize: 15))],
          ),
        ),
        actions: [
          FlatButton(
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
// ------------------------

class BottomSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              GreenTODO(),
            ],
          ),
        ),
      ],
    );
  }
}

class GreenTODO extends StatefulWidget {
  @override
  _GreenTODOState createState() => _GreenTODOState();
}

class _GreenTODOState extends State<GreenTODO> {
  String dropdownValueEspecialidade = 'Psicologia';
  String dropdownValueLocal = 'Coimbra';

  var numMesesParaMostrar = 0;
  List<Widget> grupo = <Widget>[];
  int dia;
  int mes;

  int ano;
  String mesDysplay;
  String mesDysplaysmall;

  var now = DateTime.now();
  bool selected = true;

  // var futurejson;
  var futureAlbum;

  var primeiraRun = true;

  void mesSelect(mes) {
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

  @override
  Widget build(BuildContext context) {
    // futurejson = fetchEspecialidades();
    futureAlbum = fetchAlbum();

    return FutureBuilder<ConsultorioList>(
      // future: Future.wait([futureAlbum, futurejson]),
      future: futureAlbum,
      builder: (context, snapshot) {
        grupo.clear();

        dia = 1;
        mes = int.tryParse(DateTime(now.month).toString().substring(0, 4));
        ano = int.tryParse(DateTime(now.year).toString().substring(0, 4));

        for (var mesesParaMostrar = numMesesParaMostrar; mesesParaMostrar <= 10; mesesParaMostrar++) {
          mesSelect(mes);
          if (dia == MarcacaoVariables.dia && mes == MarcacaoVariables.mes && ano == MarcacaoVariables.ano) {
            selected = true;
          } else {
            selected = false;
          }

          grupo.add(MesButton(dia: dia, mes: mes, ano: ano, mesDysplay: mesDysplay, selected: selected));

          mes++;

          if (mes == 13) {
            mes = 1;
            ano++;
          }
        }

        List<String> consultorios = [];

        var teste;

        var databottom = <Widget>[];

        if (snapshot.hasData) {
          teste = snapshot.data.consultoriolist;

          if (primeiraRun) {
            dropdownValueLocal = MarcacaoVariables.consultaLocal ?? teste[0].nomeConsultorio;
            MarcacaoVariables.consultaLocal = dropdownValueLocal;
            primeiraRun = !primeiraRun;
          }

          teste.forEach((element) {
            consultorios.add(element.nomeConsultorio);
          });

          MarcacaoVariables.arraymarcacao.forEach((element) {
            var lista = element;

            mesSelect(lista[1]);

            lista[3].forEach((element) {
              databottom.add(MarcButton(
                dia: lista[2],
                mes: lista[1],
                ano: lista[0],
                mesDysplay: mesDysplaysmall,
                element: element,
              ));
            });
          });
        }

        if (MarcacaoVariables.tipo == "Consulta") {
          return Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Local",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(232, 80, 39, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: grupo,
                        ),
                      ),
                    ),
                    CalendarioAssembled(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Column(
                        children: databottom,
                      ),
                    ),
                    Container(height: 90),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: grupo,
                        ),
                      ),
                    ),
                    CalendarioAssembled(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Column(
                        children: databottom,
                      ),
                    ),
                    Container(height: 90),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class MesButton extends StatelessWidget {
  final int dia;
  final int mes;
  final int ano;
  final String mesDysplay;
  final bool selected;

  MesButton({
    @required this.dia,
    @required this.mes,
    @required this.ano,
    @required this.mesDysplay,
    @required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    if (selected) {
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
          MarcacaoVariables.dia = dia;
          MarcacaoVariables.mes = mes;
          MarcacaoVariables.ano = ano;
          Navigator.of(context).pushReplacementNamed('/marcar_consulta');
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
}

// ignore: must_be_immutable
class CalendarioAssembled extends StatelessWidget {
  var tamanhoLista = 1;
  var num = 0;

  String tipoConsulta;
  String medico;
  int idMarcacao;
  String dtInicio;
  String consultorio;
  int idEstMarcacao;

  //--------------------------------------------
  var arrayDiasSemana = ["D", "S", "T", "Q", "Q", "S", "S"];
  var containerDiasSemana = Container();
  var linhaDiasSemana = <Widget>[];
  var rowDiasSemana = Row();

  //--------------------------------------------
  var sunday = 7;
  var saturday = 6;
  var now = DateTime.now();
  var firstdaytable = DateTime.now();
  var lastdaytable = DateTime.now();

  //--------------------------------------------
  var lines = <Widget>[];
  var linegroup = <Widget>[];
  var rowgroup = <Widget>[];
  var row = Row();
  var cont = GestureDetector();

  //--------------------------------------------
  var cor = Color.fromRGBO(137, 169, 255, 1);
  var font = FontWeight.w600;
  var colorCont = Colors.transparent;

  //--------------------------------------------
  var contadorNumeroMesAnterior = 0;
  var contadorNumeroDoMesAtual = 0;
  var contadorNumerosDoUltimoMes = 0;
  var numeroParaMostrar = "";

  //--------------------------------------------
  var small = EdgeInsets.fromLTRB(5, 5, 5, 5);
  List diaType;
  var arr1 = [];
  var arr2 = [];
  var consultas = <Widget>[];
  var stringtemp = "";
  var datadysplay = "";
  var colorCont2 = Colors.transparent;
  var container = Container();

  //--------------------------------------------
  @override
  Widget build(BuildContext context) {
    void mesSelect(type) {
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
    }

    linhaDiasSemana.clear();
    consultas.clear();
    rowgroup.clear();

    arr1.clear();
    arr2.clear();

    //--------------------------------------------
    //obter primeiro dia do mes
    var firstday = new DateTime(2021, 3, 1);
    firstdaytable = firstday;
    var numeroRepeticoesMesAnterior = 0;
    while (firstdaytable.weekday != sunday) {
      firstdaytable = firstdaytable.subtract(new Duration(days: 1));
      numeroRepeticoesMesAnterior++;
    }
    var firstdaytableDate = DateFormat.d().format(firstdaytable);

    //--------------------------------------------
    //obter ultimo dia do mes
    var lastday = new DateTime(2021, 3 + 1, 0);
    var lastdayday = DateFormat.d().format(lastday);

    lastdaytable = lastday;
    while (lastdaytable.weekday != saturday) {
      lastdaytable = lastdaytable.add(new Duration(days: 1));
    }

    //--------------------------------------------
    //adiciona a linha dos dias da semana
    for (var e = 0; e < 7; e++) {
      containerDiasSemana = Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        margin: small,
        height: 20,
        width: 20,
        child: Text(
          arrayDiasSemana[e],
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(232, 102, 0, 1),
              fontSize: 14,
            ),
          ),
        ),
      );
      linhaDiasSemana.add(containerDiasSemana);
    }
    rowDiasSemana = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: linhaDiasSemana,
    );
    rowgroup.add(rowDiasSemana);

    //--------------------------------------------
    var numeroDeColunas = 5;
    if (numeroRepeticoesMesAnterior >= 5) {
      numeroDeColunas = 6;
    }

    //--------------------------------------------
    contadorNumeroMesAnterior = 0;
    contadorNumeroDoMesAtual = 0;
    contadorNumerosDoUltimoMes = 0;
    for (var e = 0; e < numeroDeColunas; e++) {
      lines = <Widget>[];
      for (var i = 0; i < 7; i++) {
        if (e == 0) {
          if (numeroRepeticoesMesAnterior > contadorNumeroMesAnterior) {
            var firstdaytableDateint = int.tryParse(firstdaytableDate) + i;
            numeroParaMostrar = firstdaytableDateint.toString();
            cor = Colors.black;
            font = FontWeight.w400;
          } else {
            cor = Colors.red;
            font = FontWeight.w500;
            //--------------------------------------------
            if (arr1.contains(contadorNumeroDoMesAtual + 1)) {
              var possition = arr1.indexOf(contadorNumeroDoMesAtual + 1);
              var type = arr2[possition];
              mesSelect(type);
            } else {
              colorCont = Colors.transparent;
            }
            //--------------------------------------------
            contadorNumeroDoMesAtual = contadorNumeroDoMesAtual + 1;
            numeroParaMostrar = contadorNumeroDoMesAtual.toString();
          }
        } else {
          if (int.tryParse(lastdayday) > contadorNumeroDoMesAtual) {
            cor = Colors.red;
            font = FontWeight.w500;
            //--------------------------------------------
            if (arr1.contains(contadorNumeroDoMesAtual + 1)) {
              var possition = arr1.indexOf(contadorNumeroDoMesAtual + 1);
              var type = arr2[possition];
              mesSelect(type);
            } else {
              colorCont = Colors.transparent;
            }
            //--------------------------------------------
            contadorNumeroDoMesAtual = contadorNumeroDoMesAtual + 1;
            numeroParaMostrar = contadorNumeroDoMesAtual.toString();
          } else {
            contadorNumerosDoUltimoMes = contadorNumerosDoUltimoMes + 1;
            numeroParaMostrar = contadorNumerosDoUltimoMes.toString();
            cor = Colors.black;
            font = FontWeight.w400;
          }
        }

        //--------------------------------------------

        lines.add(DiaButton(
          colorCont: colorCont,
          cor: cor,
          font: font,
          numeroParaMostrar: numeroParaMostrar,
          small: small,
        ));
        contadorNumeroMesAnterior++;
      }
      rowgroup.add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: lines));
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
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: rowgroup,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DiaButton extends StatefulWidget {
  final EdgeInsets small;
  Color colorCont;
  final String numeroParaMostrar;
  final FontWeight font;
  Color cor;

  DiaButton({
    @required this.small,
    @required this.colorCont,
    @required this.numeroParaMostrar,
    @required this.font,
    @required this.cor,
  });

  @override
  _DiaButtonState createState() => _DiaButtonState();
}

class _DiaButtonState extends State<DiaButton> {
  @override
  Widget build(BuildContext context) {
    var horas = "";
    var minutos = "";

    var data = "";
    var datasend = "";

    void horasTimePicker() async {
      DatePicker.showTimePicker(
        context,
        showSecondsColumn: false,
        theme: DatePickerTheme(containerHeight: 210.0),
        showTitleActions: true,
        onConfirm: (time) {
          horas = "";
          minutos = "";
          data = "";
          datasend = "";

          if (int.parse('${time.hour}') < 10) {
            horas = '0${time.hour}';
          } else {
            horas = '${time.hour}';
          }
          if (int.parse('${time.minute}') < 10) {
            minutos = '0${time.minute}';
          } else {
            minutos = '${time.minute}';
          }
          data = horas + " : " + minutos;
          datasend = horas + ":" + minutos;
          //
          DatePicker.showTimePicker(
            context,
            showSecondsColumn: false,
            theme: DatePickerTheme(
              containerHeight: 210.0,
            ),
            showTitleActions: true,
            onConfirm: (time) {
              if (int.parse('${time.hour}') < 10) {
                horas = '0${time.hour}';
              } else {
                horas = '${time.hour}';
              }
              if (int.parse('${time.minute}') < 10) {
                minutos = '0${time.minute}';
              } else {
                minutos = '${time.minute}';
              }
              data = data + "  -  " + horas + " : " + minutos;
              datasend = datasend + "-" + horas + ":" + minutos;

              List datalist = [];
              List datasendlist = [];

              List lista = [];
              bool run = false;

              if (MarcacaoVariables.arraymarcacao.isNotEmpty) {
                MarcacaoVariables.arraymarcacao.forEach((listElement) {
                  if (run == false) {
                    if (listElement[0] == MarcacaoVariables.ano &&
                        listElement[1] == MarcacaoVariables.mes &&
                        listElement[2] == int.parse(widget.numeroParaMostrar)) {
                      var index = MarcacaoVariables.arraymarcacao.indexOf(listElement);

                      MarcacaoVariables.arraymarcacao[index][3].add(data);
                      MarcacaoVariables.arraymarcacao[index][4].add(datasend);
                      run = !run;

                      Navigator.pushReplacementNamed(context, '/marcar_consulta');
                    }
                  }
                });

                if (run == false) {
                  lista.add(MarcacaoVariables.ano);
                  lista.add(MarcacaoVariables.mes);
                  lista.add(int.parse(widget.numeroParaMostrar));

                  datalist.add(data);
                  datasendlist.add(datasend);

                  lista.add(datalist);
                  lista.add(datasendlist);
                  MarcacaoVariables.arraymarcacao.add(lista);
                  run = !run;

                  Navigator.pushReplacementNamed(context, '/marcar_consulta');
                }
              } else {
                lista.add(MarcacaoVariables.ano);
                lista.add(MarcacaoVariables.mes);
                lista.add(int.parse(widget.numeroParaMostrar));

                datalist.add(data);
                datasendlist.add(datasend);

                lista.add(datalist);
                lista.add(datasendlist);
                MarcacaoVariables.arraymarcacao.add(lista);

                Navigator.pushReplacementNamed(context, '/marcar_consulta');
              }

              Navigator.pushReplacementNamed(context, '/marcar_consulta');
            },
            currentTime: DateTime.now(),
            locale: LocaleType.pt,
          );
          //
        },
        currentTime: DateTime.now(),
        locale: LocaleType.pt,
      );
    }

    MarcacaoVariables.arraymarcacao.forEach((listElement) {
      if (listElement[0] == MarcacaoVariables.ano &&
          listElement[1] == MarcacaoVariables.mes &&
          listElement[2] == int.parse(widget.numeroParaMostrar) &&
          widget.cor == Color.fromRGBO(246, 146, 32, 1)) {
        widget.cor = Colors.white;
        widget.colorCont = Color.fromRGBO(183, 67, 52, 1);
      }
    });

    if (widget.cor == Color.fromRGBO(137, 169, 255, 1)) {
      return Container(
        alignment: Alignment.center,
        margin: widget.small,
        decoration: BoxDecoration(
          color: widget.colorCont,
          borderRadius: const BorderRadius.all(
            const Radius.circular(25.0),
          ),
        ),
        height: 28,
        width: 28,
        child: Text(
          widget.numeroParaMostrar,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: widget.font,
              color: widget.cor,
              fontSize: 14,
            ),
          ),
        ),
      ); //
    } else {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Aviso"),
                content: Text(
                    "Selecione em primeiro lugar a hora de início da sua disponibilidade, e por último a hora de fim."),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      horasTimePicker();
                    },
                  )
                ],
              );
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: widget.small,
          decoration: BoxDecoration(
            color: widget.colorCont,
            borderRadius: const BorderRadius.all(
              const Radius.circular(25.0),
            ),
          ),
          height: 28,
          width: 28,
          child: Text(
            widget.numeroParaMostrar,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: widget.font,
                color: widget.cor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class MarcButton extends StatefulWidget {
  final int dia;
  final int mes;
  final int ano;
  final String mesDysplay;
  final String element;

  MarcButton({
    @required this.dia,
    @required this.mesDysplay,
    @required this.element,
    @required this.mes,
    @required this.ano,
  });

  @override
  _MarcButtonState createState() => _MarcButtonState();
}

class _MarcButtonState extends State<MarcButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 38,
            decoration: BoxDecoration(
              color: Color.fromRGBO(183, 67, 52, 1),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.dia.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  widget.mesDysplay,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                children: [
                  Text(
                    widget.element,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(232, 102, 0, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              MarcacaoVariables.arraymarcacao.forEach((elementlist) {
                if (elementlist[0] == widget.ano && elementlist[1] == widget.mes && elementlist[2] == widget.dia) {
                  var index = MarcacaoVariables.arraymarcacao.indexOf(elementlist);
                  if (elementlist[3].length > 1) {
                    elementlist[3].forEach((data) {
                      var indexData = MarcacaoVariables.arraymarcacao[index][3].indexOf(data);
                      if (data == widget.element) {
                        MarcacaoVariables.arraymarcacao[index][3].removeAt(indexData);
                        MarcacaoVariables.arraymarcacao[index][4].removeAt(indexData);
                        Navigator.pushReplacementNamed(context, '/marcar_consulta');
                      }
                    });
                  } else {
                    MarcacaoVariables.arraymarcacao.removeAt(index);
                    Navigator.pushReplacementNamed(context, '/marcar_consulta');
                  }
                }
              });
            },
          )
        ],
      ),
    );
  }
}

// ------------------------
Future<ConsultorioList> fetchAlbum() async {
  throw Exception('Sem Net');
}

Future<EspecialidadesList> fetchEspecialidades() async {
  throw Exception('Sem Net');
}
