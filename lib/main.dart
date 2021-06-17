import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'CalendarV2.dart';
import 'Theme/config.dart';
import 'CalendarV1.dart';

import 'package:test_app/runtime_variables.dart';
import 'package:test_app/Theme/ThemeData.dart';
import 'package:test_app/Theme/CurrentTheme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('easyTheme');
  runApp(App());
}

CurrentTheme currentTheme = CurrentTheme();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
      theme: AppTheme.light2,
      darkTheme: AppTheme.dark2,
      themeMode: currentTheme.currentTheme(),
      title: 'Flutter Demo',
      routes: {
        '/Calendar': (context) => Calendar(),
        '/Calendar2': (context) => Calendar2(),
      },
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

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
          Switch(
            value: currentTheme.mode(),
            onChanged: (value) {
              currentTheme.switchTheme();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/Calendar"),
              child: Text("Calendar"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/Calendar2"),
              child: Text("Calendar"),
            ),
          ],
        ),
      ),
    );
  }
}
