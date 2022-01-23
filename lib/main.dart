import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Theme/config.dart';

import 'Pages/CalendarV1.dart';
import 'Pages/CalendarV2.dart';
import 'Pages/DiscordCloneV1.dart';

import 'package:test_app/Components/runtime_variables.dart';
import 'package:test_app/Theme/ThemeData.dart';
import 'package:test_app/Theme/CurrentTheme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('easyTheme');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light2,
      darkTheme: AppTheme.dark2,
      themeMode: currentTheme.currentTheme(),
      title: 'Flutter Demo',
      routes: {
        '/CalendarV1': (context) => CalendarShow(),
        '/CalendarV2': (context) => CalendarShow2(),
        '/DiscordCloneV1': (context) => DiscordCloneV1(),
        //
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/CalendarV1"),
              child: Text("Calendar V1", style: TextStyle(fontSize: 30)),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/CalendarV2"),
              child: Text("Calendar V2", style: TextStyle(fontSize: 30)),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/DiscordCloneV1"),
              child: Text("Discord App Clone", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
