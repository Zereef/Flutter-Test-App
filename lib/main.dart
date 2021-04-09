import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Theme/config.dart';
import 'marcarConsulta.dart';

import 'package:test_app/runtime_variables.dart';
import 'package:test_app/Theme/ThemeData.dart';
import 'package:test_app/Theme/CurrentTheme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('easyTheme');
  runApp(MyApp());
}

CurrentTheme currentTheme = CurrentTheme();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Debug features
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      title: 'Flutter Demo',
      routes: {
        '/marcarConsulta': (context) => MarcarConsulta(),
      },
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({
    Key key,
  }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    Common.width = MediaQuery.of(context).size.width;
    Common.height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("General Widget Develop"),
        actions: [
          TextButton(
            child: Text(currentTheme.currentTheme() == ThemeMode.dark ? "Dark" : "Light"),
            onPressed: () => currentTheme.switchTheme(),
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          child: Text("Foo"),
          onPressed: () => Navigator.pushNamed(context, "/marcarConsulta"),
        ),
      ),

      //old stuff
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     currentTheme.switchTheme();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
