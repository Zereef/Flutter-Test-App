import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_app/runtime_variables.dart';

import 'marcarConsulta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      //Debug features
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      //
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: Colors.pink),
      title: 'Flutter Demo',
      home: MyHomePage(title: 'General Widget Develop'),
      routes: {
        '/marcarConsulta': (context) => MarcarConsulta(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Common.width = MediaQuery.of(context).size.width;
    Common.height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(),

      //old stuff
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/marcarConsulta");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
